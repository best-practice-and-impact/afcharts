 fig <- plotly::plot_ly(data = iris, x = ~Sepal.Length, y = ~Petal.Length)

fig

fig |>
  theme_af_plotly()

theme_af_plotly <-  function(chart,
                             base_size = 14,
                             base_line_size = base_size / 24,
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

  # Set grid lines dependent on grid arg
  grid_x     <- if (grid %in% c("x", "xy")) TRUE else FALSE
  grid_y     <- if (grid %in% c("y", "xy")) TRUE else FALSE

  # Set axis lines dependent on axis arg
  axis_x     <- if (axis %in% c("x", "xy")) TRUE else FALSE
  axis_y     <- if (axis %in% c("y", "xy")) TRUE else FALSE

  # Set axis ticks dependent on ticks arg
  ticks_x    <- if (ticks %in% c("x", "xy")) "outside" else ""
  ticks_y    <- if (ticks %in% c("y", "xy")) "outside" else ""

  chart |>
    plotly::layout(
      font = list(
        colour = "black",
        size = base_size,
        family = afcharts_font
      ),

      margin = list(
        l = 80,
        b = 80,
        r = 80,
        t = 0
      ),

      # title
      title = list(
        text = "This is the title",
        font = list(
          size = 1.6 * base_size
        ),
        xref = "paper",
        xanchor = "left",
        yanchor = "top",
        x = 0,
        y = 1,
        pad = list(
          t =  half_line * 2 * (96 / 72)
        )
      ),

      # x axis
      xaxis = list(
        fixedrange = TRUE,

        # axis
        showline = axis_x,
        linecolor = light_grey,
        linewidth = base_line_size * (96 / 72),

        # ticks
        ticks = ticks_x,
        tickcolor = light_grey,
        ticklen = half_line / 2 * (96 / 72),
        tickwidth = base_line_size * (96 / 72),
        tickangle = 0,

        # grid
        showgrid = grid_x,
        gridwidth = base_line_size * (96 / 72),
        gridcolor = light_grey
      ),

      # y axis
      yaxis = list(
        fixedrange = TRUE,

        # axis
        showline = axis_y,
        linecolor = light_grey,
        linewidth = base_line_size * (96 / 72),

        # ticks
        ticks = ticks_y,
        tickcolor = light_grey,
        ticklen = half_line / 2 * (96 / 72),
        tickwidth = base_line_size * (96 / 72),
        tickangle = 0,

        # grid
        showgrid = grid_y,
        gridwidth = base_line_size * (96 / 72),
        gridcolor = light_grey
      ),

      #hoverlabel
      hoverlabel = list(
        bgcolor = "white",
        font = list(
          color = "black",
          size = base_size
        )
      )
    ) |>
    plotly::config(
      displayModeBar = FALSE,
      scrollZoom = FALSE,
      displaylogo = FALSE
    )

}
