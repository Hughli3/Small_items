#Mac的数据地址
setwd("~/Documents/学习/共享/OneDrive/数据/武汉工行")

bianjie<-read.csv('wuhan_bianjie.csv',header = T)

#求经纬度各自的最大、最小值
lon_max<-max(bianjie[1])
lon_min<-min(bianjie[1])
lat_max<-max(bianjie[2])
lat_min<-min(bianjie[2])

plot(bianjie)
plot(bianjie[1],bianjie[2])
pairs(bianjie[1],bianjie[2])

range(bianjie[1])
#经度差113.7077 115.0858
range(bianjie[2])
#维度差29.97290 31.36705
lon_dis30<-c(0.00520)
lon_dis30<-c(0.00525)
lat_dis<-c(0.00450)
  
#30.45000 - 30.44550 = 0.00450 = 0.5km（115经度下计算）
#115.10000 - 115.09480 = 0.00520 = 0.5km （30维度下计算）
#115.10000 - 115.09475 = 0.00525 = 0.5km （31维度下计算）

start_point = c(lat_max,lon_min)
#设置一个起始点

length(seq(lat_min,lat_max,lat_dis30))

num_of_lat <- length(seq(lat_max, lat_min, by = - lat_dis))
num_of_lon <- length(seq(lon_min, lon_max, by = lon_dis30))
#求按照500米分割在经度和维度方向上各存在多少个点

position <- array(1:(num_of_lat*num_of_lon),c(1,2,num_of_lon,num_of_lat))
#c(1,2,num_of_lat*num_of_lon)的意思是每个数组都是1*2的，一共有num_of_lat*num_of_lon个,
#且每个数组按照num_of_lat,num_of_lon组成2位矩阵

lat <- seq(lat_max,lat_min, by = - lat_dis)
lon <- seq(lon_min,lon_max, by =  lon_dis30)

i=0
j=0
for(i in 1:num_of_lon){
  for(j in 1:num_of_lat){
    position[1,2,i,j] <- lat[j]
    position[1,1,i,j] <- lon[i]
    j <- j + 1
    print("j:")
    print(j)
  }
  i <- i + 1
  print('i')
  print(i)
  j <- 1
}

array(1:24,c(1,2,3,4))
