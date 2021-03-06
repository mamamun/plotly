context("Facets")

# test_that("6 facets becomes 6 panels", {
#   require(lattice)
#   gg <- qplot(yield, variety, data=barley, color=year, facets=site~., pch=I(1))+
#     theme_bw()+
#     theme(panel.margin=grid::unit(0, "cm"))
#   info <- gg2list(gg)
#   traces <- info[names(info)==""]
#   trace.axes <- list()
#   for(N in c("xaxis", "yaxis")){
#     trace.axes[[N]] <- axes.vec <- 
#       sapply(traces, function(t){
#         if(N %in% names(t)){
#           t[[N]]
#         }else{
#           NA
#         }
#       })
#     expect_true(all(!is.na(axes.vec)))
#   }
#   trace.axes.df <- as.data.frame(trace.axes)
#   u <- unique(trace.axes.df)
#   expect_identical(nrow(u), 6L)
# })

test_that("3 facets becomes 3 panels", {
  df <- data.frame(x=runif(99), y=runif(99), z=rep(c('a','b','c'), 33))
  gg <- qplot(x, y, data=df, facets=z~., pch=I(1))+
    theme_bw()+
    theme(panel.margin=grid::unit(0, "cm"))
  info <- gg2list(gg)
  traces <- info[names(info)==""]
  trace.axes <- list()
  for(N in c("xaxis", "yaxis")){
    trace.axes[[N]] <- axes.vec <- 
      sapply(traces, function(t){
        if(N %in% names(t)){
          t[[N]]
        }else{
          NA
        }
      })
    expect_true(all(!is.na(axes.vec)))
  }
  trace.axes.df <- as.data.frame(trace.axes)
  u <- unique(trace.axes.df)
  expect_identical(nrow(u), 3L)
})
