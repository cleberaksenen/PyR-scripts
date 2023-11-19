dados <- read.csv("BASE_DADOS.csv", sep=";")

#Anti-N
antiN <- subset(dados, tipo == 1)
antiN$mes_coleta <- substr(antiN$data_coleta, 1, 7)

antiN <- subset(antiN, mes_coleta != "2021-07")
antiN <- subset(antiN, mes_coleta != "2021-08")
antiN <- subset(antiN, mes_coleta != "2021-11")

# Filtro por mes
filter_by_month <- function(antiN, month) {
  M <- subset(antiN, mes_coleta == month)
  q1 <- quantile(M$anticorpo, 0.25)
  q3 <- quantile(M$anticorpo, 0.75)
  iqr <- q3 - q1
  LI <- q1 - 1.5 * iqr
  LS <- q3 + 1.5 * iqr
  M <- subset(M, M$anticorpo >= LI & M$anticorpo <= LS)
  return(M)
}

months <- c("2020-03", "2020-04", "2020-05", "2020-06", "2020-07", "2020-08",
            "2020-09", "2020-10", "2020-11", "2020-12", "2021-01", "2021-02",
            "2021-03", "2021-04", "2021-05", "2021-06")

filtered_data <- lapply(months, function(month) filter_by_month(antiN, month))
names(filtered_data) <- paste("M", 1:length(filtered_data), sep = "")
result_list <- setNames(filtered_data, 
                        paste("M", 1:length(filtered_data), sep = ""))

#Dataset combinado
combined_data <- do.call(rbind, filtered_data)
write.csv(combined_data, "AntiN_filtrado.csv", row.names = FALSE)
