
#loading the bibliometrix library
library(bibliometrix)

#loading the data, note path name should be changed!
scopusdata <- readFiles("C:/Users/Lorik Mucolli/Desktop/bibliometric_analysis/data_english_2008-2018/scopus.bib")

M <- convert2df(scopusdata, dbsource = "scopus", format = "bibtex")


# the function biblioAnalysis() preforms a descriptive analysis of the data frame
results <- biblioAnalysis(M, sep = ";")

# the function summary() creates a summary of the main information about the data
S=summary(object = results, k = 10, pause = FALSE)


# the function plot() creates basic plots of the data
# *pause* is a logical variable to allow (or not) screen scrolling, k is a variable for number of first attributes
plot(x=results, k=10, pause=FALSE)


#checking out most cited references, CR (cited references) is a field in M
M$CR[1]
CR <‐ citations(M,field="article", sep = ";")

#getting the most cited articles
CR$Cited[1:10]

# getting the most cited authors
CR2 <‐ citations(M, field = "author", sep = ";")
CR2[1:10]

#using biblioNetwork() to get bibliographic cocitation graph
NetMatrix <‐ biblioNetwork(M, analysis = "co‐citation", network = "references", sep = ". ")
net=networkPlot(NetMatrix, n = 20, Title = "Bibliographic cocitation", type = "fruchterman", size=FALSE, remove.multiple=TRUE)

#using biblioNetwork() to get bibliographic collaboration graph
NetMatrix2 <‐ biblioNetwork(M, analysis = "collaboration", network = "authors", sep = ";")
net2=networkPlot(NetMatrix2, n = 20, Title = "Bibliographic collaboration", type = "fruchterman", size=FALSE, remove.multiple=TRUE)

#co-citation network
NetMatrix3 <‐ biblioNetwork(M, analysis = "co‐citation", network = "references", sep = ". ")
net3=networkPlot(NetMatrix3, n = 5, Title = "Co‐Citation Network", type = "fruchterman", size=T, remove.multiple=TRUE)

#keyword occurrences
NetMatrix4 <‐ biblioNetwork(M, analysis = "co‐occurrences", network = "keywords", sep = ";")
net=networkPlot(NetMatrix, n = 20, Title = "Keyword Co‐occurrences", type = "kamada", size=T)
