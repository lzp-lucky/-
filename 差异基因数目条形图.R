setwd("C:\\Users\\HUAWEI\\Desktop\\proteomic_correct\\绘图\\总差异基因数目双向条形图")
# 代码来源：https://www.r2omics.cn/# 
# 加载R包，没有安装请先安装
# install.packages("tidyverse")
library(tidyverse)

# 读取双向柱形图数据文件
df <- read.csv("number无logFCbacteria.csv")
# 这里读取了网络上的demo数据，将此处换成你自己电脑里的文件

# 转换为绘图所需要的长数据
df <- df %>%
  pivot_longer(
    -1,
    names_to = "Sample",
    values_to = "Value"
  )

# 绘图
p <- ggplot(df, aes(
  y = factor(X, levels = unique(X)), # 将第一列转化为因子，目的是显示顺序与文件顺序相同，否则按照字母顺序排序
  x = ifelse(df$Sample == "Down", -Value, Value), # 判断分组情况，将两个柱子画在0的两侧
  fill = df$Sample
)) +
  geom_bar(stat = "identity") + # 画柱形图
  geom_text(
    aes(label = Value), # 标签的值（数据框的第三列）
    hjust = ifelse(df$Sample == "Down", 1, -0.5), # 水平位置
    size = 2 # 标签大小
  ) +
  labs(
    x = "", # 设置x轴标签
    y = "", # 设置y轴标签
    fill = "" # 设置填充图例标签
  ) +
  theme_bw() +
  scale_x_continuous(
    labels = abs, # 刻度设置为绝对值
    expand = expansion(mult = c(0.1, 0.1)) # 在x轴的两侧，留下一部分的空白位置，防止加标签的时候，显示不全
  )+
scale_fill_manual(values = c("Up" = "#E89DA0", "Down" = "#C7DFF0")) # 指定“Up”为红色，“Down”为蓝色

# 打印图形
pdf("number.pdf", width = 7, height = 5)
print(p)
dev.off()




setwd("C:\\Users\\HUAWEI\\Desktop\\proteomic_correct\\绘图\\总差异基因数目双向条形图")
# 加载R包，没有安装请先安装
# install.packages("tidyverse")
library(tidyverse)

# 读取双向柱形图数据文件
df <- read.csv("number.csv")

# 转换为绘图所需要的长数据
df <- df %>%
  pivot_longer(
    -1,
    names_to = "Sample",
    values_to = "Value"
  )

# 绘图
p <- ggplot(df, aes(
  x = factor(X, levels = unique(X)),  # 将第一列转化为因子，目的是显示顺序与文件顺序相同
  y = ifelse(df$Sample == "Down", -Value, Value), # 判断分组情况，将两个柱子画在0的上下两侧
  fill = df$Sample
)) +
  geom_bar(stat = "identity") + # 画柱形图
  geom_text(
    aes(label = Value), # 标签的值（数据框的第三列）
    vjust = ifelse(df$Sample == "Down", 1.5, -0.5), # 垂直位置
    size = 2 # 标签大小
  ) +
  labs(
    x = "", # 设置x轴标签
    y = "", # 设置y轴标签
    fill = "" # 设置填充图例标签
  ) +
  theme_classic() +
  scale_y_continuous(
    labels = abs, # 刻度设置为绝对值
    expand = expansion(mult = c(0.4, 0.4)) # 在y轴的上下两侧，留下一部分的空白位置，防止加标签的时候，显示不全
  ) +
  scale_fill_manual(values = c("Up" = "#E89DA0", "Down" = "#C7DFF0")) # 指定“Up”为红色，“Down”为蓝色

# 打印图形
pdf("numberbacteria.pdf", width = 8, height = 1.5)
print(p)
dev.off()




