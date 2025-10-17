library(readr)
d_1_6 <- read_csv("C:/Users/graciasatya/Downloads/2025-08-04.csv")
View(d_1_6)
names(d_1_6)

#hanya perlu data id sampai Pm10
#lakukan subsetting data set
#artinya memilih berdasarkan nama variabel

#contoh contains
contoh1 = select(d_1_6,contains("pm"))

#kalau error could not find function "select"
#artinya ada package yang belum dihidupkan
#cara aktivasi package
library(tidyverse)
#masih eror karena belum instal
#instal dulu 
install.packages("tidyverse")
library(tidyverse)
# sudah OK

#contoh membuang yang contains pm
contoh2 = select(d_1_6,-contains("pm"))
#contoh mengambil dari variabel ini sampai itu
contoh3 = select(d_1_6, id:pm10)
names(contoh3)

#tugas labeling jam 00 - 09 subjek A, diatas jam 09 subjek B
#berikan id kepada observasi diatas jam 09:00:00
#langkah 1 harus buat variabel baru pakai kode $
contoh3$id_subject = NA

#langkah 2 potong data dari jam 9 keatas
contoh3 = slice(contoh3, 41:3640)

#langkah 3 isi id_subject dengan 1-6
contoh3$id_subject = "1-6"

contoh4 = select(d_1_6, id:pm10)
contoh4$id_subject = NA
contoh4 = slice(contoh4, 1:40)
contoh4$id_subject = "No_subject"

#langkah 4 menggabungkan observasi dari 2 dataset
#syarar jummlah dan jenis variabel sama
contoh3_4 = rbind (contoh4, contoh3)


#mengisi variabel id subject berdasarkan no urut obsevasi
#observasi 1-40 di isi no_subject
#observasi 41 - 3640 di isi 1-6

contoh5= select(d_1_6, id:pm10)
contoh5$id_subject = NA
contoh5$id_subject [1:40] = "No_subject"
contoh5$id_subject [41:3640] = "1-6"

newd_1_6_2 = select(d_1_6_2, id:pm10)
newd_1_6_2$id_subject = NA
newd_1_6_2$id_subject [1:2159] = "1-6"
newd_1_6_2$id_subject [2160:3154] = "1-7"

#gabungkan 2 tanggal yaitu tanggal 4 dan 5 agustus
fixd_1_6 = rbind(contoh5,newd_1_6_2)
 
#export ke csv
write.csv (fixd_1_6,"Tugas2_gracia.csv")

ggplot (data= fixd_1_6,aes(x=time, y=pm1)) + geom_point (size=0.5, color="blue")+ labs (x="Time" , y="Exposure pm1")+ ggtitle("24 Hours PM1 Exposure")
