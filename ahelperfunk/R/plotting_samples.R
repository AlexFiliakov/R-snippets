

Sample_CorrBL_HistoFitTR <- function() {
  # group histograms by color
  pairs(
    iris[1:4],
    main = "Anderson's Iris Data -- 3 species",
    pch = 21,
    bg = c("red", "green3", "blue")[unclass(iris$Species)]
  )

  ## put histograms on the diagonal
  panel.hist <- function(x, ...)
  {
    usr <- par("usr"); on.exit(par(usr))
    par(usr = c(usr[1:2], 0, 1.5) )
    h <- hist(x, plot = FALSE)
    breaks <- h$breaks; nB <- length(breaks)
    y <- h$counts; y <- y/max(y)
    rect(breaks[-nB], 0, breaks[-1], y, col = "cyan", ...)
  }

  pairs(USJudgeRatings[1:5], panel = panel.smooth,
        cex = 1.5, pch = 24, bg = "light blue",
        diag.panel = panel.hist, cex.labels = 2, font.labels = 2)

  ## put (absolute) correlations on the upper panels,
  ## with size proportional to the correlations.
  panel.cor <- function(x, y, digits = 2, prefix = "", cex.cor, ...)
  {
    usr <- par("usr"); on.exit(par(usr))
    par(usr = c(0, 1, 0, 1))
    r <- abs(cor(x, y))
    txt <- format(c(r, 0.123456789), digits = digits)[1]
    txt <- paste0(prefix, txt)
    if(missing(cex.cor)) cex.cor <- 0.8/strwidth(txt)
    text(.5, .5, txt, cex = cex.cor * r)
  }
  #pairs(USJudgeRatings, lower.panel = panel.cor, upper.panel = panel.smooth)

  # pairs(iris[-5], log = "xy") # plot all variables on log scale
  # pairs(iris, log = 1:4, # log the first four
  #       main = "Lengths and Widths in [log]", line.main=1.5, oma=c(2,2,3,2),
  #       lower.panel = panel.smooth, upper.panel = panel.cor)
  #
  # Basic Scatterplot Matrix

  pairs(
    ~ wt + mpg + disp + drat,
    data = mtcars,
    main = "Simple Scatterplot Matrix",
    upper.panel = panel.smooth,
    lower.panel = panel.cor
  )

  #ggpairs(mtcars, columns = c("wt", "mpg", "disp", "drat"))


  pairs(
    iris,
    main = "Simple Scatterplot Matrix",
    upper.panel = panel.smooth,
    lower.panel = panel.cor
  )

  require(GGally)
  print(ggpairs(iris))

  #corrgram(mtcars, lower.panel=panel.shade, upper.panel=panel.ellipse)

  # Ellipse Plots are very misleading:
  # corrgram(
  #   iris,
  #   main = "Iris data with example panel functions",
  #   lower.panel = panel.pts,
  #   upper.panel = panel.ellipse,
  #   diag.panel = panel.density
  # )
  #
}

SamplePiecewiseRegression <- function() {
  require(segmented)

  x <- c(1:10, 13:22)
  y <- numeric(20)
  ## Create first segment
  y[1:5] <- seq(20, 18, len=5) + rnorm(5, 0, 1.5)
  # Throw Wrench!
  y[6:10] <- seq(17, 11, len=5) + rnorm(5, 0, 1.5)
  ## Create second segment
  y[11:20] <- seq(11, 15, len=10) + rnorm(10, 0, 1.5)
  ## Plot it
  par(mar=c(4,4,1,1)+0.2)
  plot(x,y, ylim=c(5, 20), pch=16)

  lin.mod <- lm(y~x)
  segmented.mod <- segmented(lin.mod, seg.Z = ~x, psi=list(x=c(17,11)))

  plot(x,y, pch=16, ylim=c(5,20))
  plot(segmented.mod, add=T)
}

SamplePiecewiseRegression()
Sample_CorrBL_HistoFitTR()
