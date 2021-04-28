
install.packages("VennDiagram")
install.packages("futile.logger")
library(VennDiagram)
library(grid)
grid.newpage()
venn.plot <- draw.pairwise.venn(36.2, 13.8, 3.6, c("Agreeging", "UniversityDegree"),  scale = FALSE, fill = c("yellow", "green"))
grid.draw(venn.plot)
