# Spatio-temporal T cell tracking for personalized TCR-T designs in childhood cancer

Directories contain Jupyter Notebooks (JN) and corresponding HTML reports in order to reproduce the results from this project. Each folder starting by *SCGRES\_\** is a batch of samples of the project:
- `SCGRES_83_84/`: contains PBMCs cells from blood time points T1,T2,T3
- `SCGRES_99_100/`: contains CD45+ cell-sorted fraction from the Tumor at timepoint 0 (T0), also the CD45- fraction with stromal and tumoral cells, plus CD3+ enriched fraction of T0 and finally PBMCs of time point T5.
- `SCGRES_105_106/`: contains PBMCs of time point T6.
- `SCGRES_119_120/`: contains PBMCs of time points T4 and T7.
- `SCGRES_124_125/`: contains CD3+ cells from *in vitro* culture experiment: cells in 41BB+ fraction, cells in 41BB- fraction and cells from the control condition. 

The parent `scripts/` directory contains general analysis using data from different batches. 
The `utils/` folder contains some extra utilities such as functions in the `bin.R` and `style.R` with aesthetics for plotting. 
Each directory described above contains a `scripts/` with the JN and `reports/` with the HTML output results of corresponding JN that were run with data of that specific folder. Therefore,outputs of JN executed for more than one dataset are reported as HTMLs. 

Inside each `SCGRES_*/` subdirectory we can either have executed JNs or HTML reports of JNs of the following:
	
	*Quality control*
    
        `2.0-qc_cellranger_mapping.html`
		`2.1-more_qc_and_filtering.html`
		`2.2-doublet_detection.html`

	*Pre-processing*
    
        `3.0-normalization_and_embedding_*.ipynb`
		`3.2-Clustering_and_filtering_*.ipynb`

	*First annotation* (level one of annotation of cell types per library/sample)
    
        `4.0-*_l1.ipynb`
        
    *In experiment folder (SCGRES_124_125) we also have annotation and TCR analysis of this dataset*
    
        `4.0.0-Integration.ipynb`
        `4.0.1-Reclustering_and_Annotation.ipynb`
        `5.0-TCR_analysis.ipynb`

Inside `scripts/` in the parent directory we have the following:

	*Annotation of all immune cell infiltrates in Tumor (TME)
    
        `4.0.1-Integration_l1_Tumor.ipynb`
	
	*Annotations of all T-cells in Tumor (TME)
    
        `4.2-T-cells_Tumor.ipynb`
        `4.2.1-CD8_analysis.ipynb`
        `4.2.2-CD4_analysis.ipynb`

	*Annotations of all T-cells in PBMCs time points
    
        `4.2.2-T-cell_annotation_PBMC.ipynb`
    
    *Adding TCR and clonotype analysis
    
        `5.0-scRepertoire_PBMC.ipynb`
        `5.0-scRepertoire_Tumor.ipynb`
        `5.4-T-helper_clonotypes.ipynb`

    *Check phenotypes of 19 selected OS-T clonotypes*
    
        `5.2-Phenotyping_deepTCR.ipynb`

    *Check phenotypes of shared clonotypes between TME and Blood*
    
        `5.3-TCR_selection.ipynb`

    *41BB positive signature of activation*
    
        `5.5-Signature_41BB.ipynb`
