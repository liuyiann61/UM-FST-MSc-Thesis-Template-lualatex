# latexmkrc - Configuration file for latexmk

# Use lualatex by default
$pdf_mode = 1;  # 1 means PDF mode, i.e., use lualatex or pdflatex to generate PDF
$lualatex = 'lualatex -interaction=nonstopmode -synctex=1 %O %S';

# Define the commands to run for each LaTeX step
$pdflatex = $lualatex;  # Use lualatex for PDF generation
$latex = 'latex -interaction=nonstopmode -synctex=1 %O %S';

# If you use biber for bibliography
$biber = 'biber %O %S';

# Add makeglossaries command
$makeglossaries = 'makeglossaries %S';

# Custom dependency checking
@default_files = ('Master_Thesis_Template.tex');  # Specify the main file (without extension)

# Automatically run biber if necessary
$bibtex_use = 2;  # Use biber instead of bibtex
$bibtex_cmd = $biber;

# Number of times to run lualatex
$max_repeat = 5;

# Custom clean-up targets (e.g., auxiliary files generated during compilation)
@generated_exts = ('aux', 'bbl', 'bcf', 'blg', 'idx', 'ind', 'lof', 'log', 'lot', 'out', 'toc', 'acn', 'acr', 'alg', 'glg', 'glo', 'gls', 'ist', 'fls', 'fdb_latexmk');

# Always view PDF after compilation
$pdf_mode = 1;
$pdf_update_method = 1;

# Silence output except for errors and warnings
$silent = 1;

# Add glossaries dependency
add_cus_dep('glo', 'gls', 0, 'makeglossaries');
add_cus_dep('acn', 'acr', 0, 'makeglossaries');

sub makeglossaries {
	system("makeglossaries $_[0]");
}

# Run makeglossaries if .glo file exists
$clean_ext .= ' glo gls glg acr alg';