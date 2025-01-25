library(readxl)
library(psych)
library(corrplot)

# Wczytanie pliku Excel
data <- read_excel("dane.xlsx")

# Sprawdzenie wczytanych danych
head(data)

# Podstawowe statystyki dla danych
describe(data)

# Współczynnik zmienności (CV) - obsługuje brakujące wartości
cv <- function(x) {
  if (length(x) > 1 && !all(is.na(x))) {
    return(sd(x, na.rm = TRUE) / mean(x, na.rm = TRUE) * 100)
  } else {
    return(NA)  # Zwróć NA dla zmiennej z jednym elementem lub jeśli cała jest NA
  }
}

# Wybór tylko kolumn numerycznych
data_numeric <- data[sapply(data, is.numeric)]

# Obliczanie współczynnika zmienności (CV) dla każdej zmiennej numerycznej
cv_values <- sapply(data_numeric, cv)
print(cv_values)

# Obliczanie macierzy korelacji dla zmiennych numerycznych
cor_matrix <- cor(data_numeric, use = "complete.obs")  # 'complete.obs' ignoruje brakujące wartości

# Wykres korelacji
corrplot(cor_matrix, method = "circle")
