#### Bash-based data management ####

# clean environment
rm(list=ls())

# set working directory
setwd("/home/IZSNT/n.radomski/Documents/RstudioWorkingDirectory/BashDataManagement")

# install regular packages
install.packages("ggplot2")
install.packages("ggpmisc")
install.packages("reshape2")
install.packages("plyr")

# call library
library(ggplot2)
library(ggpmisc)
library(reshape2)
library(plyr)

# read dataframe
data_long = read.table("dataframe.tsv", dec = ".", header=TRUE, sep = "\t", quote = "")

# check dimension
dim(data_long)
# => [1] 15  5

# check 20 first lines
head(data_long, 20)

#check nature of variables (integer, factor or number)
str(data_long)

# answer to the question: Is there a correlation between the expected and estimated depth of coverage?

## Pearson correlation coefficient test
cor(x=data_long$expected_depth, y=data_long$estimated_depth, method="pearson")
# => [1] 0.9998014

## p-value of Pearson correlation coefficient test
cor.test(x=data_long$expected_depth, y=data_long$estimated_depth, method="pearson")
# => t = 180.88, df = 13, p-value < 2.2e-16

## Graphical representation
my.formula <- y ~ x
p = ggplot(data = data_long, aes(x = expected_depth, y = estimated_depth)) +
  theme_light(base_size = 16) +
  geom_point() +
  geom_smooth(size = 0.5, fill = "#A9A9A9", method=lm, linetype="dashed", se=FALSE, formula = my.formula) +
  scale_shape_manual(values=c(20, 20, 20)) +
  scale_size_manual(values=c(3,3,3)) +
  theme(legend.position="bottom") +
  scale_x_continuous(name = "Expected depth of coverage (X)", limits = c(10, 105), breaks = c(10,20,30,40,50,60,70,80,90,100)) +
  scale_y_continuous(name = "Estimated depth of coverage (X)", limits = c(10, 105), breaks = c(10,20,30,40,50,60,70,80,90,100)) +
  stat_poly_eq(formula = my.formula, 
               aes(label = paste(..eq.label.., ..rr.label.., sep = "~~~")), 
               parse = TRUE,label.y = "top", label.x = "left", rr.digits = 3, coef.digits = 3, f.digits = 6)
p
plot(p)
ggsave("correlation-depth.tiff",device="tiff",width=17,height=17,units="cm",dpi="retina")
ggsave("correlation-depth.pdf",device="pdf",width=17,height=17,units="cm",dpi="retina")
dev.off()

# => There is a significant (p-value < 2.2e-16) correlation (R2=99.98%) between the expected and estimated depth of coverage

# answer to the question: Are there significance differences between GC% of genome types?

## switch from long to short dataframe for Wilcoxon tests
str(data_long)
data_short <- dcast(data_long, formula = expected_depth~genome_type, value.var = "GC_content")
head(data_short, 20)
str(data_short)
dim(data_short)

## Wilcoxon signed-rank tests
### genome type A versus genome type B
wilcox.test(data_short$A, data_short$B, paired = TRUE)
# => V = 6, p-value = 0.8125
### genome type A versus genome type C
wilcox.test(data_short$A, data_short$C, paired = TRUE)
# => V = 15, p-value = 0.05791 (cannot compute exact p-value with ties)
### genome type B versus genome type C
wilcox.test(data_short$B, data_short$C, paired = TRUE)
# => V = 15, p-value = 0.05447 (cannot compute exact p-value with ties)

## Graphical representation
p = ggplot(data = data_long, aes(x = genome_type, y = GC_content)) +
  theme_light(base_size = 16) +
  geom_boxplot(color = "#000000", fill = "#A9A9A9", coef = 6, outlier.colour = "white", outlier.shape = 0, outlier.size = 0) +
  geom_point(position = position_jitter(width = 0.2), size = 2, color = "#000000", alpha = 0.7, shape = ".") +
  theme(axis.text.x = element_text (color = "#000000", size = 12, angle = 0, vjust = 0.5)) +
  scale_y_continuous(name = "GC content (%)", limits = c(37.8, 38.2), breaks = c(37.8,37.9,38.0,38.1,38.2)) +
  scale_x_discrete(name = "Genome type") +
  theme(plot.title = element_text(color="black", size=12, face="bold.italic"),
        strip.text.x = element_text(size=16, face = "bold"),
        strip.text.y = element_text(size=16, face="bold"),
        strip.background = element_rect(colour="black", fill="#A9A9A9"))
p
plot(p)
ggsave("differences-GC.tiff",device="tiff",width=17,height=17,units="cm",dpi="retina")
ggsave("differences-GC.pdf",device="pdf",width=17,height=17,units="cm",dpi="retina")

## Numerical estimation
ddply(data_long, .(genome_type), summarize,  mean_value=mean(GC_content), standard_deviation=sd(GC_content))
#genome_type mean_value standard_deviation
#1           A     38.132         0.01303840
#2           B     38.134         0.01140175
#3           C     37.910         0.01224745

# => There is not significant differences (p-value = 0.8125) of GC content between genome type A (38.132±0.013) and B (38.134±0.011)
# => There is significant differences (p-value = 0.05791) of GC content between genome type C (37.910±0.012) and B (38.134±0.011)
# => There is significant differences (p-value = 0.05447) of GC content between genome type C (37.910±0.012) and A (38.132±0.013)