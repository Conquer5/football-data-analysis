#Principal Component Analysis and Factor Analysis 

#import data
data <- read.csv("C:/Users/RENDRA/OneDrive/Documents/KODING SEMS4/ANMUL/bolaANMUL.csv")
print(data)

str(data)

# Cek jumlah missing value
sum(is.na(data))

# Ambil hanya kolom numerik untuk analisis statistik deskriptif
data_num <- data[sapply(data, is.numeric)]

# Summary statistik deskriptif dasar
summary(data_num)

# Statistik deskriptif tambahan
library(psych)
describe(data_num)

par(mfrow = c(3, 4))  # Atur layout 3 baris x 4 kolom

for (col in names(data_num)) {
  hist(data_num[[col]], 
       main = paste("Histogram of", col), 
       xlab = col, 
       col = "skyblue", 
       border = "black")
}

#Check KMO
library(psych)
r <- cor(data)
KMO(r)

#Bartlett Test
bartlett.test(data)


#---------Principal Component Analysis-----------

##manual----

scale_data = scale(data)
r = cov(scale_data)
##Menghitung eigenvalue dan eigenvector
pc <- eigen(r)
pc$values

library(dplyr)
##Menghitung proporsi varians dan kumulatif
sumvar <- sum(pc$values)
propvar <- sapply(pc$values, function(x) x/sumvar)*100
cumvar <- data.frame(cbind(pc$values, propvar)) %>% mutate(cum = cumsum(propvar))
colnames(cumvar)[1] <- "value"
rownames(cumvar) <- paste0("PC",c(1:p))
print(cumvar)

#hasilPCA
pc$vectors
scores <- as.matrix(scale_data) %*% pc$vectors
head(scores)

##function in R----
#prcomp
PCA.mod <- prcomp(scale_data)
summary(PCA.mod)       #vs t(cumvar)
PCA.mod$rotation       #vs pc$vectors
head(PCA.mod$x)        #vs head(scores)

#using library FactoMineR
# https://rpubs.com/cahyaalkahfi/pca-with-r
library(FactoMineR)
pca_result <- PCA(scale_data, 
                  scale.unit = TRUE, 
                  graph = FALSE, 
                  ncp=p)     # ncp kita set agar menghasilkan output semua dimensi (default 5)

# menampilkan ringkasan hasil pca
pca_result$eig          # vs print(cumvar)
pca_result$svd$V        # vs pc$vectors
pca_result$ind['coord'] # vs head(scores)


#Visualisasi
library(factoextra)
# membuat scree plot
fviz_eig(pca_result, 
         addlabels = TRUE, 
         ncp = p, 
         barfill = "skyblue", 
         barcolor = "darkblue", 
         linecolor = "red")

#Biplot
fviz_pca_biplot(pca_result, 
                geom.ind = "point", 
                #col.ind = status.ipm, 
                #palette = c("#FC4E07","#E7B800", "#00AFBB"), 
                addEllipses = TRUE, 
                #legend.title = "Kategori"
                )

# correlation circle
contrib_circle <- fviz_pca_var(pca_result, col.var = "contrib",
                               gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"), 
                               repel = TRUE) + 
  ggtitle("Kontribusi Variabel")
plot(contrib_circle)

#contribution
contrib_v_PC1 <- fviz_contrib(pca_result, choice = "var", axes = 1, top = 5) + ggtitle("PC1")
contrib_v_PC2 <- fviz_contrib(pca_result, choice = "var", axes = 2, top = 5) + ggtitle("PC2")
contrib_v_PC3 <- fviz_contrib(pca_result, choice = "var", axes = 3, top = 5) + ggtitle("PC3")
plot(contrib_v_PC3)

#---------Factor Analysis-----------
varcov = cov(scale_data)
pc = eigen(varcov)
pc$values
pc$vectors
sp = sum(pc$values[1:3])

L1 = sqrt(pc$values[1])*pc$vectors[,1]
L2 = sqrt(pc$values[2])*pc$vectors[,2]
L3 = sqrt(pc$values[3])*pc$vectors[,3]

L = cbind(L1,L2,L3)
L

# Perform factor analysis 
library(psych)
fa <- fa(r = scale_data, 
         covar = TRUE,
         nfactors = 3, 
         rotate = "varimax") 
#summary(fa) 

load <- fa$loadings

plot(load[,c(1,3)],type="n") # set up plot
text(load[,c(1,3)],labels=names(data),cex=.7)

fa.diagram(load)
