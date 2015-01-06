# Load packages
require(knitr)
require(markdown)

# Load packages
require(knitr)
require(markdown)

# Create .md, .html, and .pdf files
knit("Effective_TransmissionType.rmd")
markdownToHTML('Effective_TransmissionType.md', 'Effective_TransmissionType.html', options=c("use_xhml"))
system("pandoc -s Effective_TransmissionType.html -o Effective_TransmissionType.pdf")
