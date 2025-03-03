iris <- iris |> dplyr::mutate(Sepal.Length = Sepal.Length * 100)

 fig <- plotly::plot_ly(data = iris, x = ~Sepal.Length, y = ~Petal.Length)

fig

 fig |>
  theme_af_plotly()


theme_af_plotly <-  function(chart,
                             base_size = 14,
                             grid = c("y", "x", "xy", "none"),
                             axis = c("x", "y", "xy", "none"),
                             ticks = c("xy", "x", "y", "none"),
                             legend = c("right", "left", "top", "bottom", "none")) {


  grid   <- match.arg(grid)
  axis   <- match.arg(axis)
  ticks  <- match.arg(ticks)
  legend <- match.arg(legend)

  # Set colours
  light_grey <- "#d9d9d9"

  # Use built in sans font
  afcharts_font <- "Arial"

  half_line <- base_size / 2
  base_line_size = base_size / 24

  # Set grid lines dependent on grid arg
  grid_x     <- if (grid %in% c("x", "xy")) TRUE else FALSE
  grid_y     <- if (grid %in% c("y", "xy")) TRUE else FALSE

  # Set axis lines dependent on axis arg
  axis_x     <- if (axis %in% c("x", "xy")) TRUE else FALSE
  axis_y     <- if (axis %in% c("y", "xy")) TRUE else FALSE

  # Set axis ticks dependent on ticks arg
  ticks_x    <- if (ticks %in% c("x", "xy")) "outside" else ""
  ticks_y    <- if (ticks %in% c("y", "xy")) "outside" else ""


  y_title <- plotly::plotly_build(chart)$x$layout$yaxis$title |> unclass()
  x_title <- plotly::plotly_build(chart)$x$layout$xaxis$title |> unclass()

  chart |>
    plotly::layout(
      font = list(
        color = "black",
        size = base_size * ( 96 / 72),
        family = afcharts_font
      ),

      # margin = list(
      #   l = 80,
      #   b = 80,
      #   r = 80,
      #   t = 0
      # ),

      # # title
      # title = list(
      #   text = "This is the title",
      #   font = list(
      #     size = 1.6 * base_size
      #   ),
      #   xref = "paper",
      #   yref = "container",
      #   xanchor = "left",
      #   yanchor = "top",
      #   x = 0,
      #   y = 1,
      #   automargin = TRUE,
      #   pad = list(b = ((half_line * 2) + base_size) * (72 / 96))
      # ),


      # x axis

      xaxis = list(

        fixedrange = TRUE,

        # title
        title = list(
          text = x_title,
          font = list(
            color = "black",
            size = base_size * (96 / 72),
            family = afcharts_font
          )
        ),


        # axis
        showline = axis_x,
        linecolor = light_grey,
        linewidth = base_line_size * 3.7795,

        # ticks
        ticks = ticks_x,
        tickcolor = light_grey,
        ticklen = half_line / 2 * (96 / 72),
        tickwidth = base_line_size * 3.7795,
        tickangle = 0,

        # grid
        showgrid = grid_x,
        gridwidth = base_line_size * 3.7795,
        gridcolor = light_grey
      ),

      # y axis
      annotations = list(
        xref = "paper",
        xanchor = "left",
        x = 0,
        yref = "paper",
        yanchor = "bottom",
        y = 1,
        text = y_title,
        showarrow = FALSE,
        font = list(
          size = base_size * ( 96 / 72)
        )
      ),

      yaxis = list(
        fixedrange = TRUE,

        # title
        title = list(
          text = NA
        ),

        # axis
        showline = axis_y,
        linecolor = light_grey,
        linewidth = base_line_size * 3.7795,

        # ticks
        ticks = ticks_y,
        tickcolor = light_grey,
        ticklen = half_line / 2 * (96 / 72),
        tickwidth = base_line_size * 3.7795,
        tickangle = 0,

        # grid
        showgrid = grid_y,
        gridwidth = base_line_size * 3.7795,
        gridcolor = light_grey
      ),

      #hoverlabel
      hoverlabel = list(
        bgcolor = "white",
        font = list(
          color = "black",
          size = base_size * (96 / 72),
          family = afcharts_font
        )
      )
    ) |>
    plotly::config(
      displayModeBar = FALSE,
      scrollZoom = FALSE,
      displaylogo = FALSE
    )

}



 fig |>
  theme_af_plotly()

 library(ggplot2)
 ggplot(data = iris, aes(x = Sepal.Length, y = Petal.Length)) +
   geom_point() +
   theme_af() +
   labs(title = "This is the title")

