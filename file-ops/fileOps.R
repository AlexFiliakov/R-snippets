#ls()
#data=read.csv()
#savehistory("C:/Users/dwarr/Dropbox/Actuarial/Lab/R/fileOps.R")

# gets all files in directory
# then creates new names using gsub()


list.files(path = "./Source Data/",pattern = glob2rx("000?*.csv"))
sf = list.files(path = "./Source Data/",pattern = glob2rx("00?*.csv"),full.names = TRUE)
sf
nf = gsub("SampleData","Report1",sf)
nf
file.rename(sf,nf)
#nf2=gsub("Report1","Report2",nf)
nf2
#file.copy(nf,nf2)
sf = list.files(path = "./Source Data/",pattern = glob2rx("00?*.csv"),full.names = TRUE)
sf
