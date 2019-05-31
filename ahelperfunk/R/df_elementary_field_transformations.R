
import_raw_csv <- function() {
  transaction.csv <- "data-raw/to-replace-product-on-fund.csv"
  transaction.rep.product.on.fund.df <-
    read.csv(transaction.csv, header = TRUE)
  save(transaction.rep.product.on.fund.df,
       file = "data/to-replace-product-on-fund.rda")
}

replace_product_on_fund <- function() {
  load("data/to-replace-product-on-fund.rda")
  in.df <- transaction.rep.product.on.fund.df

  #in.df <- in.df[(in.df$ToFund == "GA" &
  #                  in.df$ToProduct == "LRX") | (in.df$FromFund == "GA"),]


  # Correct FromProduct
  in.df$FromProduct[in.df$ToFund == "GA" &
                      in.df$ToProduct == "LRX"] <-
    "LRX"

  # Correct ToProduct
  in.df$ToProduct[in.df$FromFund == "GA" &
                      in.df$FromProduct == "LRX"] <-
    "LRX"


  result <- in.df

  return (result)

}

