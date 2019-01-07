DF1<-refine_original
library(dplyr)
DF1$company[1:6]<-"philips"
DF1$company[14:16]<-"philips"
DF1$company[7:13]<-"akzo"
DF1$company[17:21]<-"van houten"
DF1$company[22:25]<-"unilever"
library(tidyr)
DF1<-separate(DF1,Product.code...number,
             c("product_code","product_number"),sep="-")
DF1<-mutate(DF1,product_category="empty")
DF1$product_category<-ifelse(DF1$product_code=="p","Smartphone"
                            ,DF1$product_category)
DF1$product_category<-ifelse(DF1$product_code=="v","TV",DF1$product_category)
DF1$product_category<-ifelse(DF1$product_code=="x","Laptop",DF1$product_category)
DF1$product_category<-ifelse(DF1$product_code=="q","Tablet",DF1$product_category)
DF1<-unite(DF1,address,city,country, col = "full_address",sep = ",")
DF1<-mutate(DF1,company_philips="empty")
DF1<-mutate(DF1,company_akzo="empty")
DF1<-mutate(DF1,company_van_houten="empty")
DF1<-mutate(DF1,company_unilever="empty")

DF1$company_philips<-ifelse(DF1$company=="philips","1","0")
DF1$company_akzo<-ifelse(DF1$company=="akzo","1","0")
DF1$company_van_houten<-ifelse(DF1$company=="van houten","1","0")
DF1$company_unilever<-ifelse(DF1$company=="unilever","1","0")

DF1<-mutate(DF1,product_smartphone="empty")
DF1<-mutate(DF1,product_tv="empty")
DF1<-mutate(DF1,product_laptop="empty")
DF1<-mutate(DF1,product_tablet="empty")

DF1$product_smartphone<-ifelse(DF1$product_category=="Smartphone","1","0")
DF1$product_tv<-ifelse(DF1$product_category=="TV","1","0")
DF1$product_laptop<-ifelse(DF1$product_category=="Laptop","1","0")
DF1$product_tablet<-ifelse(DF1$product_category=="Tablet","1","0")

write.csv(DF1,file = "refine_clean.csv")


