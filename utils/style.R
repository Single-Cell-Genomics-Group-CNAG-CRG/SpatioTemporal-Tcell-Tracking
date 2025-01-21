# Palettes from where to generate colors
blues_greens_palette <- c("#00b8f4", "#0066ffff", "#0088d4", "#2affd5ff", "#001f3f", "#2c5aa0ff", "#0088aaff", "#8be4ff", "#aaffaaff", "#80b3ffff")

oranges_yellows_palette <- c("#ff4500", "#ff7f00", "#ffb74d", "#ffd699", "#ffcc00ff", "#ffebcc")

pink_palette <- c("#ffd5e5ff", "#ff80b2ff", "#c83771ff")

purple_palette <- c("#eed7f4ff", "#cd87deff", "#aa00d4ff")

mut_purple <- c("#c8b7c4ff", "#916f8aff")

# L1 integrated 

intgr_pal <- list("Classical Monocytes"="#cd87deff", 
                  "Non classical Monocytes"="#ffd5e5ff",
                  "NKs"="#ff7f00ff",
                  "CD4 T cells"="#2ca25f",
                  "Dendritic cells"="#c8b7c4ff",
                  "Plasma cells"="#ffe680ff",
                  "CD8 T cells"="#80b3ffff",
                  "Proliferative cells"="#2c5aa0ff",
                  "Progenitors JARID2+"="#999999ff",
                  "Platelets"="#554400ff",
                  "Progenitors CD34+"="#1a1a1aff",
                  "B cells"="#ffcc00ff",
                  "Macrophages"="#c83771ff",
                  "Mφ Monocytes"="#c83771ff",
                  "T helpers"= '#6B8E23',
                  "γδ T cells"='#0088aaff',
                  "Mast cells"="#d8b365")

tumor_pal <- c("0" = "#0000FF",
                "1" = "#4169E1",
                "3" = "#6495ED",
                "4" = "#87CEEB",
                "8" = "#00BFFF",
                "10" = "#1E90FF",
                "2" = "#00FF00",
                "5" = "#32CD32",
                "6" = "#6B8E23",
                "9_0" = "#228B22",
                "9_1" = "#008000",
                "11" = "#9ACD32",
                "13" = "#a1d99b",
                "7" = "#6f8a91ff",
                "12" = "#53676cff")

pbmc_pal = c("0"='#41ae76',
              "1"="#9acd32ff",
              "2"="#c2e184",
              "3"="#32cd32ff",
              "4"="#80e5ffff",
              "5_0"="#7bccc4",
              "5_1"="#228B22",
              "6"="#4b51f2",
              "7"='#89a02cff',
              "8"="#aad400ff",
              "9"="#0000FF",
              "10"="#7bcc95",
              "11"="#808080ff",
              "12"="#00FF00",
              "13"="#7ba6cc",
              "14_0"="#c8c4b7ff",
              "14_1"="#87CEFA",
              "15"="#ac9d93ff")

stromal_pal = list("Tumor SEMA3D"="#fdae6b", 
                    "Tumor CDH18"="#de77ae",
                    "Tumor Cycling"="#A58AFF",
                    "Tumor SGCZ"="#ffdd55ff",
                    "Tumor SEMA6D"="#fb6a4a",
                    "Fibroblast"="#80cdc1",
                    "Tumor TENM2"="#00BA38",
                    "Tumor FBN2"="#dfc27d",
                    "Endothelial cells"='#ffaaaaff')

exp_pal = c("Naive CD8"="#80e5ffff",
            "Effector Hobit CD8"="#87ceebff",
            "Effector CD4"='#41ae76',
            "Cytotoxic CD8"="#003380ff",
            "T-helpers"='#89a02cff',
            "41BB CD8"="#5599ffff",
            "41BB γδv1 T cells"="#6c5353ff",
            "Proliferative CD8"="#7bccc4",
            "41BB Prolif." = "#6f8a91ff",
            "Prolif. cytotoxic CD8"="#7ba6cc",
            "IFN-response CD8"="#006680ff",
            "MAIT"="#808080ff")


tp_pal = c("T0"="#525252",
           "T1"="#ffff00ff",
           "T2"="#D73027",
           "T3"="#67000d",              
           "T4"="#FF7F00",
           "T5"="#6A3D9A",
           "T6"="#C51B7D",
           "T7"="#8C510A")