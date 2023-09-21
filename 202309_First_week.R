#2023.9.16用脚本编写，存储

##第二章##
1/200*30
(67+22+9)/3
sin(pi/2)
x<-3*4  #赋值
x  #输出x的值
x<-13
x
this_is_really_a_long_name<-2.2
this_is_really_a_long_name
this_is_really_a_long_name#变量名用tab补全
this_is_really_a_long_name

seq(1,10)
x<-seq(1,10)
x

x<-"莫雪美"   #字符输入，英文双引号“”
x

x<-"haha
+你好"

y<-seq(1,10,length.out=5)  # 格式化函数，lenght.out 为选项option
y
(y<-seq(1,10,length.out=5))
(y<-seq(1,10,length.out=5))


##第十五章##

typeof(letters)
typeof(seq(1,2))
length(y)

lenght(x)

x<-list("moxuemei","a",1:10)
length(x)

1:10%%3==0

c(FALSE,FALSE,TRUE,FALSE,NA)

typeof(1)
typeof(1L)
x<-sqrt(2)^2
x
x-2

c(-1,0,1)/0 # -inf负无穷  inf正无穷

c(FALSE,FALSE,TRUE,FALSE,NA)
x<-c(FALSE,FALSE,TRUE,FALSE,NA)
is.na(x)
y<-c(-1/3,-100,2,2)
is.infinite(y)
x<-1
y<-rep(x,100)
y
pryr::object.size(y)

x<-sample(20,100,replace=TRUE)
x
y<-x<10
y
sum(y)  #统计学大数定律：随机变量序列的算术平均值向随机变量各数学期望的算术平均值收敛的定律。

x<-sample(20,10000,replace=TRUE)
x
mean(x)
x<-sample(20,100000,replace=TRUE)
mean(x)
y<-x>10
mean(y)

tibble(x=1:4,y=1:2) #Error 长度1或4
tibble(x=1:4,y=rep(1:2,2))

c(x=1:2,y=3:4,z=5:6) #向量命名

x<-c("one","two","there")
x[c(3,2,1)]  #向量取子集
x[c(1,2,3,2,2,2,1,1,4)]

x<-c(10,3,NA,5,8,1,NA)
is.na(x)
!is.na(x)
x[!is.na(x)]

##第一章 使用ggplot2进行数据可视化##

install.packages("tidyverse")
library(tidyverse)
library(dplyr)
?mpg
mpg

#散点图
ggplot(data=mpg)+
  geom_point(mapping = aes(x=displ,y=hwy))

ggplot(data=mpg)+
  geom_point(mapping = aes(x=displ,y=hwy,color=class))#颜色分类

ggplot(data=mpg)+
  geom_point(mapping = aes(x=displ,y=hwy,color=trans))

ggplot(data=mpg)+
  geom_point(mapping = aes(x=displ,y=hwy,color=year))

ggplot(data=mpg)+
  geom_point(mapping = aes(x=displ,y=hwy,size=class))#大小分类

ggplot(data=mpg)+
  geom_point(mapping = aes(x=displ,y=hwy,alpha=class))#透明度分类

ggplot(data=mpg)+
  geom_point(mapping = aes(x=displ,y=hwy,shape=class))#形状分类
  
ggplot(data=mpg)+
  geom_point(mapping = aes(x=displ,y=hwy),color="blue")#  格式变化，颜色在xy映射外面

ggplot(data=mpg)+
  geom_point(mapping = aes(x=displ,y=hwy),color="red")

ggplot(data=mpg)+
  geom_point(mapping = aes(x=displ,y=hwy),color="pink")

#分面,适合添加分类变量
ggplot(data=mpg)+
  geom_point(mapping=aes(x=displ,y=hwy))+
  facet_wrap(~class,nrow=2)
#分面,适合添加分类变量
#ggplot(data=mpg)+
#  geom_point(mapping=aes(x=displ,y=hwy))+
#  facet_grid(drv~cyl)
ggplot(data=mpg)+
  geom_point(mapping=aes(x=displ,y=hwy))+
  facet_grid(drv~cyl)
#平滑曲线+置信区间
ggplot(data=mpg)+
  geom_smooth(mapping=aes(x=displ,y=hwy))

ggplot(data=mpg)+
  geom_smooth(mapping=aes(x=displ,y=hwy,linetype=drv))

ggplot(data=mpg,mapping = aes(x=displ,y=hwy))+
  geom_point(mapping=aes(color=class))+
  geom_smooth()
#  geom_smooth(mapping=aes(x=displ,y=hwy,linetype=drv))

#练习1

ggplot(data=mpg)+
  geom_point(mapping = aes(x=displ,y=hwy))+        
  geom_smooth(mapping=aes(x=displ,y=hwy),se=FALSE)
#练习2
ggplot(data=mpg)+
  geom_point(mapping = aes(x=displ,y=hwy))+        
  geom_smooth(mapping=aes(x=displ,y=hwy,linetype=drv),se=FALSE)
#练习3
ggplot(data=mpg,mapping = aes(x=displ,y=hwy))+
  geom_point(mapping = aes(color=drv))+
  geom_smooth(mapping=aes(color=drv),se=FALSE)

#练习4
ggplot(data=mpg,mapping = aes(x=displ,y=hwy))+
  geom_point(mapping = aes(color=drv))+
  geom_smooth(mapping=aes())
#练习5
ggplot(data=mpg,mapping = aes(x=displ,y=hwy))+
  geom_point(mapping = aes(color=drv))+
  geom_smooth(mapping = aes(linetype=drv))

#练习6
ggplot(data=mpg,mapping = aes(x=displ,y=hwy))+
  geom_point(mapping = aes(color=drv))




#统计变量
ggplot(data=diamonds)+
  geom_bar(mapping=aes(x=cut))

#比例直方图
ggplot(data=diamonds)+
  geom_bar(
    mapping=aes(x=cut,y=..prop..,group=1)
  )

ggplot(data=diamonds)+
  stat_summary(
    mapping=aes(x=cut,y=depth),
    fun.ymin=min,
    fun.ymax=max,
    fun.y=median
  )
#直方图上色
ggplot(data=diamonds)+
  geom_bar(mapping=aes(x=cut,color=cut))

ggplot(data=diamonds)+
  geom_bar(mapping=aes(x=cut,fill=cut))

ggplot(data=diamonds)+
  geom_bar(mapping=aes(x=cut,fill=clarity))

ggplot(data=diamonds)+
  geom_bar(
    mapping=aes(x=cut,fill=clarity),
    position="dodge"
  )

ggplot(data=mpg)+
    geom_point(mapping=aes(x=displ,y=hwy),
               position="jitter"
               )

##第三章 使用dplyr进行数据转换##


install.packages("nycflights13")
library(nycflights13)
library(tidyverse)
flights
view(flights)##查看数据源

#filter(flights,month==1,day==1)
filter(flights,month == 1,day == 1)

filter(flights,month==11|month==12)
nov_dec<-filter(flights,month %in% c(11,12))
nov_dec

jan1<-filter(flights,month==1,day==1)
jan1

install.packages("dplyr")
#筛选filter()
filter(flights,dest=="IAH"|dest=="HOU")
filter(flights,dest %in%c("IAH","HOU"))

filter(flights,arr_delay>2 &dep_delay<=0)
#排序arrange()
arrange(flights,desc(arr_delay))

#选择select()
select(flights,year,month,day)
select(flights,year:day)#year和day之间的所有列，包含year,day
select(flights,-(year:day))#year和day之间的所有列，不包含year,day
rename(flights,tail_num=tailnum)
select(flights,time_hour,air_time,everything())#前置指定列，其他列放在后面
select(flights,starts_with("ye"))
rename(flights,Year=year)
filter(flights,between(year,2013,2014)) 
filter(flights ,between(arr_delay,-1,3))

#添加新变量mutate（）
flights_sml<-select(flights,
                    year:day,
                    ends_with("delay"),
                    distance,
                    air_time
                    )
mutate(flights_sml,
       gain=arr_delay-dep_delay,
       speed=distance/air_time*60,
       gain_per_hour=gain/hours
       )

transmute(flights,
          gain=arr_delay-dep_delay,
          hours=air_time/60,
          gain_per_hour=gain/hours)
view(flights_sml)

#分组摘要summarize()，把数据框折叠成一行
summarize(flights,delay=mean(dep_delay,na.rm=TRUE)) #na.rm=TRUE剔除残缺值

by_day<-group_by(flights,year,month,day)
summarize(by_day,delay=mean(dep_delay,na.rm=TRUE))


by_dest<-group_by(flights,dest)  #以为dest进行分组
delay<-summarize(by_dest,
                 count=n(),  #每组计数
                 dist=mean(distance,na.rm=TRUE),
                 delay=mean(arr_delay,na.rm=TRUE)
                 )
delay

delay<-filter(delay,count>20,dest!="HNL")
delay

ggplot(data=delay,mapping=aes(x=dist,y=delay))+
  geom_point(aes(size=count),alpha=1/4)+
  geom_smooth(se=FALSE)

#管道 %>%  读作“然后”
delays<-flights %>%
  group_by(dest) %>%
  summarize(
    count=n(),
    dis=mean(distance,na.rm=TRUE),
    delay=mean(arr_delay,na.rm=TRUE)
  )%>%
  filter(count>20,dest!="HNL")
delays

not_cancelled<-flights %>%
  filter(!is.na(dep_delay),!is.na(arr_delay))
not_cancelled %>%
  group_by(year,month,day) %>%
  summarize(mean=mean(dep_delay))
#计数
delays<-not_cancelled %>%
  group_by((tailnum) %>%
  summarize(
    delay=mean(arr_delay))
           )
ggplot(data=delays,mapping = aes(x=delay))+
  geom_freqpoly(binwidth=10)

not_cancelled %>%
  group_by(year,month,day) %>%
  summarize(
    time1<-min(dep_time),
    time2<-max(dep_time)
  )


#练习！！
flights %>%
  filter( ((month==7&day==4)|(month==12&day==25))&(dest%in%c("DCA","IAD","BWI"))) %>%
  group_by(dest,month,day) %>%
  summarize(
    Min_time=min(arr_delay,na.rm=TRUE),
    Max_time=max(arr_delay,na.rm=TRUE),
    SD_time=sd(arr_delay,na.rm=TRUE),
    Ave_Time=mean(arr_delay,na.rm=TRUE)
  )


##第九章 使用dplyr处理关系数据##

airlines
view(airports)
view(planes)
view(weather)

#定义数据集x,y
x<-tribble(
  ~key,~val_x,
  1,"x1",
  2,"x2",
  2,"x3",
  1,"x4"
)

y<-tribble(
  ~key,~val_y,
  1,"y1",
  2,"y2"
)
left_join(x,y,by="key") 
right_join(x,y,by="key")
full_join(x,y,by="key")
inner_join(x,y,by="key")

#定义flights2
flights2<-flights %>%
  select(year:day,hour,origin,dest,tailnum,carrier)
flights2


flights2 %>%
  left_join(weather)#自然链接，默认值by=NULL#Joining with `by = join_by(year, month, day, hour, origin)`

flights %>%
  left_join(planes,by="tailnum")#公共变量链接

flights %>%
  left_join(airports,c("dest"="faa"))#命名字符向量by=c("a"="b")

#P125练习
flights %&%
  mutate(Ave_time=mean(arr_delay))
left_join(airports)

top_dest<-flights %>%
  count(dest,sort=TRUE) %>%
  head(10)
top_dest

#semi_join(x,y) 保留相匹配的所有观测值
flights %>%
  semi_join(top_dest)
#anti_join(x,y) 丢弃相匹配的所有观测值
flights %>%
  anti_join(top_dest)

flights %>%
  anti_join(planes,by="tailnum") %>%
  count(tailnum,sort = TRUE)  #sort=True将拼接的数组根据列名排序

rescale01<-function(x){
  rng<-range(x,na.rm = T)
  (x-rng[1])/(rng[2]-rng[1])
}
rescale01(c(10,1,0,3,1,6))

##1 练习x\y\z平方的和 
SUM1<-function(x,y,z){
  x^2+y^2+z^2
}
SUM1(2,3,4)
##2 练习x\y\z平方的和
SUM2<-function(x){
  x[1]^2+x[2]^2+x[3]^2
}
SUM2(c(2,3,4))
