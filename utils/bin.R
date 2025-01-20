plot_histogram_qc <- function(df, x, x_lab) {
  df %>%
    ggplot(aes_string(x)) +
    geom_histogram(bins = 100) +
    labs(x = x_lab, y = "Number of Cells") +
    theme_pubr()
}

add_reso_results <- function(seurat_obj, df, resolution) {
  df_subset <- df[df$resolution == resolution, ]
  df_subset <- df_subset[order(match(df_subset$barcode, rownames(seurat_obj@meta.data))), ]
  seurat_obj$seurat_clusters <- as.factor(df_subset$cluster_id)
  return(seurat_obj)
}

# This function was stolen ;) from Ramon Massoni (https://github.com/Single-Cell-Genomics-Group-CNAG-CRG/tonsil_atlas/blob/preprint_atac/scRNA-seq/bin/utils.R)
cluster_diff_resolutions <- function(seurat_obj,
                                      min_resolution,
                                      max_resolution,
                                      step) {
  # Define resolutions
  resolutions <- seq(from = min_resolution, to = max_resolution, by = step)
  
  
  # Find clusters
  resolutions_dfs <- lapply(resolutions, function(x) {
    seurat_obj <- Seurat::FindClusters(seurat_obj, resolution = x)
    df <- data.frame(
      barcode = colnames(seurat_obj),
      cluster_id = as.character(seurat_obj$seurat_clusters)
    )
    df
  })

  # Merge data frames
  names(resolutions_dfs) <- resolutions
  resolutions_df <- dplyr::bind_rows(resolutions_dfs, .id = "resolution")
  resolutions_df$resolution <- as.numeric(resolutions_df$resolution)
  resolutions_df
}

run_scrublet <- function(seu_obj){
  count_matrix <- as.matrix(seu_obj@assays$RNA@counts)
  scrr = scrubDoublets(count_matrix,
                        expected_doublet_rate=0.06,
                        min_counts=2, 
                        min_cells=3, 
                        min_gene_variability_pctl=85, 
                        n_prin_comps=30)

  seu_obj$doublet_score = scrr$doublet_scores_obs
  seu_obj$doublet_pred = scrr$scrubDoublets
  seu_obj
}

find_perc <- function(l, perc = .50){
    list_len <- length(l) # how many vectors
    tab_it <- table(unlist(l)) # tabulate all the names
    tab_it_perc <- tab_it / list_len # calculate the frequencies
    names(tab_it_perc[tab_it_perc >= perc]) # return those with freq >= perc
}

# Function to split and rejoin strings
split_and_rejoin <- function(input_string, separator) {
  split_parts <- strsplit(input_string, separator)[[1]]
  return(paste0(split_parts[c(1, length(split_parts))], collapse = "."))
}

gg_volcano_DEgenes <- function(DEgenes_df, title, ident_1, ident_2, 
                               threshold_log2FC, threshold_adjpval, labels) {
  # Pre-process data
  DEgenes_df <- DEgenes_df %>% 
    mutate(is_sig_direction = case_when(
      p_val_adj < threshold_adjpval & avg_log2FC > threshold_log2FC ~ "UP",
      p_val_adj < threshold_adjpval & avg_log2FC < -threshold_log2FC ~ "DOWN",
      TRUE ~ "FALSE"))
  
  if (missing(labels)) {
    labels_1 <- DEgenes_df %>% 
      dplyr::arrange(desc(threshold_log2FC), threshold_adjpval) %>% 
      dplyr::filter(p_val_adj < threshold_adjpval & avg_log2FC > threshold_log2FC) %>% 
      pull(gene)
    labels_1 <- labels_1[1:50]
    labels_2 <- DEgenes_df %>% 
      dplyr::arrange(desc(threshold_log2FC), threshold_adjpval) %>% 
      dplyr::filter(p_val_adj < threshold_adjpval & avg_log2FC < -1*threshold_log2FC) %>% 
      pull(gene)
      labels_2 <- labels_2[1:50]
    labels <- c(labels_2, labels_1)
  }
  genes <- DEgenes_df %>% pull(gene)

  genes <- as.character(genes)
  volcano_plot <- EnhancedVolcano(DEgenes_df,
                                  lab = genes,
                                  x = 'avg_log2FC',
                                  y = 'p_val_adj',
                                  pCutoff = threshold_adjpval,
                                  FCcutoff = threshold_log2FC,
                                  selectLab = labels, # vector of genes of interest to write as label
                                  drawConnectors = TRUE,
                                  widthConnectors = 0.75,
                                  title = title)
  volcano_plot
}

barplot_clonotypes <- function(df_plot, xcol, name_xcol) {
    plt <- ggplot(df_plot, aes_string(x = xcol, y = "count", fill = "category")) +
      geom_bar(stat = "identity",colour = "black",size = 0.2) +

      labs(#title = "Clonotype sizes in\nTreg clusters",
           x = name_xcol,
           y = "Count",
           fill = "Sizes") +
           scale_fill_manual(breaks = c("1 < X <= 5", "5 < X <= 10", 
                                        "10 < X <= 20", "X > 20"),
                             values = c('#7D06A5','#CA4778','#F69441','#F0F921')) + 
      theme_classic() +
      theme(plot.title = element_text(hjust = 0.5, size = 16, face = "bold"),
            axis.text.x = element_text(size = 16), 
            axis.title.y = element_text(size = 18, face="bold"), 
            axis.text.y = element_text(size = 16),
            text = element_text(size = 18),
            legend.text = element_text(size = 12)) + coord_flip()
    
    plt
}

umap_plot<- function(df, colors, title) {
    
    ggplot(df %>% arrange(desc(ranking)), aes(x = UMAP_1, y = UMAP_2, 
                                              color = ranking, 
                    size = ifelse(ranking == "unselected", "small", "big"))) +
      geom_point() +
      scale_size_manual(values = c("small" = 0.5, "big" = 1.5),name = "") +
      scale_color_manual(values = c(colors, "unselected"= "#d9d9d9")) +
      labs(title = title,
           x = "UMAP_1", 
           y = "UMAP_2") +
      theme_classic() + 
        theme(plot.title = element_text(hjust = 0.5,size=14, face='bold'),
            legend.position = "right", 
            legend.title.align=0.5,
            legend.text=element_text(size=14)) +
      guides(
         size="none",
         color = guide_legend(title = "", ncol = 1)
      )
}