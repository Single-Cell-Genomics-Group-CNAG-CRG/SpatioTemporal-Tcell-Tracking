# Spatio-temporal T cell tracking for personalized TCR-T designs in childhood cancer

Directories contain Jupyter Notebooks (JN) and corresponding HTML reports in order to reproduce the results from this project. Each folder starting by *SCGRES\_\** is a batch of samples of the project:
- `SCGRES_83_84/`: contains PBMCs cells from blood time points T1,T2,T3
- `SCGRES_99_100/`: contains CD45+ cell-sorted fraction from the Tumor at timepoint 0 (T0), CD3+ enriched fraction of T0 and PBMCs of time point T5.
- `SCGRES_105_106/`: contains PBMCs of time point T6.
- `SCGRES_119_120/`: contains PBMCs of time points T4 and T7.
- `SCGRES_124_125/`: contains CD3+ cells from *in vitro* culture experiment: cells in 41BB+ fraction, cells in 41BB- fraction and cells from the control condition. 

The parent `scripts/` and `reports/` directories contain general analysis using data from different batches. 
The `utils/` folder contains some extra utilities such as functions in the `bin.R` and `style.R` with aesthetics for plotting. 
Each directory described above contains a `scripts/` with the JN and `reports/` with the HTML output results of corresponding JN that were run with data of that specific folder. Therefore,
outputs of JN executed for more than one dataset are reported as HTMLs. 

Inside each `SCGRES_*/` subdirectory we can either have executed JNs or HTML repots of JNs of the following:
	*Quality control*
		`2.0-qc_cellranger_mapping.html`
		`2.1-more_qc_and_filtering.html`
		`2.2-doublet_detection.html`

	*Pre-processing*
		`3.0-normalization_and_embedding_*.ipynb`
		`3.2-Clustering_and_filtering_*.ipynb`

	*First annotation* (level one of annotation of cell types per library/sample)
		`4.0-*_l1.ipynb`
