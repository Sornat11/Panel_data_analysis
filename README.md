## Ogólne informacje
Celem projektu jest analiza danych panelowych z 16 województw Polski (lata 2013–2022) w celu zidentyfikowania czynników wpływających na wskaźnik małżeństw. W badaniu wykorzystano modele ekonometryczne (Pooled OLS, efekty stałe, efekty losowe) oraz rozwiązano problemy autokorelacji i normalności reszt.

## Dane
### Zmienne
- **Zmienna zależna**: `malzenstwa_wskaznik` (liczba małżeństw na 10 tys. mieszkańców).
- **Zmienne objaśniające**: 
  - `rozwody` (wskaźnik rozwodów), `urodzenia_zywe` (urodzenia żywe), `wynagrodzenie` (średnie wynagrodzenie), `srednia_cena_mieszk` (średnia cena mieszkań), `przedszkole` (liczba przedszkoli na 10 tys. mieszkańców).
  - **Wykluczone zmienne**: `zywnosc`, `saldo_migracji`, `mieszkania_oddane`, `urodzenia_pozamalzenskie`, `cena_metr_kw` (niska zmienność/korelacja).

### Źródło danych
Dane pochodzą z Banku Danych Lokalnych GUS. Brak brakujących wartości.

## Metodologia
### Testowane modele
1. **Pooled OLS**: Ignorował efekty indywidualne i czasowe.
2. **Efekty stałe (FE)**: Uwzględnił specyfikę województw.
3. **Efekty losowe (RE)**: Traktował różnice między województwami jako losowe.
4. **Modele dwukierunkowe**: Dodano efekty czasowe.

### Wybór modelu
- **Test Hausmana**: Wybrano model FE (p < 2.2e-16).
- **Model końcowy**: Jednokierunkowy FE z transformacją Prais-Winsten (Durbin-Watson: 2.419).

### Diagnostyka
- **Autokorelacja**: Skorygowano metodą Prais-Winsten.
- **Normalność**: Test Shapiro-Wilka wykazał nienormalność reszt (p = 0.0023).

## Użycie
### Wymagania
- R (≥4.0)
- Pakiety: `plm`, `dplyr`, `lmtest`, `sandwich`, `car`, `psych`, `corrplot`, `ggplot2`, `prais`.

### Instalacja
```R
install.packages(c("plm", "dplyr", "lmtest", "sandwich", "car", "psych", "corrplot", "ggplot2", "prais"))
```

**Autorzy**: Jakub Sornat, Maciej Tajs  
**Kontakt**: [jakubsornat2001@gmail.com]  
**Licencja**: MIT  
**Repozytorium**: [https://github.com/Sornat11/Panel_data_analysis]