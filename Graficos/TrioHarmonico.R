library(ggplot2)

dados <- read.csv("dados.csv", sep=";")

#Graficos
grafico <- ggplot(data = dados, aes(x = eixoX, y = eixoY, fill = eixoY)) +
  geom_violin(alpha = 0.5, position = position_dodge(width = 0.75), size = 1, color = NA) +
  geom_boxplot(notch = F, outlier.size = -1, color = "black", lwd = 1, alpha = 0.7, show.legend = F) +
  ggbeeswarm::geom_quasirandom(shape = 21, dodge.width = 0.75, color = "black", alpha = 0.5, show.legend = F) +
  scale_fill_manual(values = c("#daf8e3", "#97ebdb", "#00c2c7", "#0086ad")) +
  theme(panel.border = element_rect(color = "black", fill = NA, size = 1),
        axis.text = element_text(face = "bold", size = 10),
        axis.title = element_text(face = "bold", size = 14),
        legend.title = element_text(size = 16, face = "bold"),
        legend.text = element_text(size = 10, face = "bold"),
        legend.position = c(0.9, 0.80)) +  
  xlab("EixoX") +  
  ylab("EixoY") +
  labs(fill = "Legenda") +
  guides(fill = FALSE)

ggsave("grafico.jpg", plot = grafico, width = 16, height = 4, dpi = 1200)

#Grafico interativo
grafico_interativo <- ggplotly(grafico)

library(htmlwidgets)
saveWidget(grafico_interativo, file = "grafico.html")

