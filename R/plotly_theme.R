#' Analysis Function theme for plotly charts.
#'
#' @description plotly theme for Analysis Function plots.
#'
#' @param chart a `plotly` chart object
#' @param base_size base font size, given in pts.
#' @param grid, axis, ticks 'x', 'y', 'xy' or 'none' to determine for which axes
#'   the attribute should be drawn. Grid defaults to 'y', axis to 'x', and ticks
#'   to 'xy'.
#' @param legend 'right', 'left', 'top', 'bottom', or 'none' to determine the
#'   position of the legend. Defaults to 'right'.
#'
#' @returns A modified `plotly` chart
#'
#' @examples
#'
#' library(plotly)
#'
#' irisnew <- iris |>
#'   dplyr::mutate(
#'     Sepal.Length = Sepal.Length * 100,
#'     Petal.Length = Petal.Length * 100
#'   )
#'
#' fig <- plot_ly(
#'   data = irisnew,
#'   x = ~Sepal.Length,
#'   y = ~Petal.Length,
#'   color = ~Species
#' ) |>
#'   add_markers() |>
#'   layout(
#'     title = list(text = "new title \n second line"),
#'     legend = list(
#'       title = list(text='<b>Species</b>')
#'     )
#'   )
#'
#' fig |>
#'   theme_af_plotly()
#'
#' @export
theme_af_plotly <-  function(chart,
                             base_size = 14,
                             grid = c("y", "x", "xy", "none"),
                             axis = c("x", "y", "xy", "none"),
                             ticks = c("xy", "x", "y", "none"),
                             legend = c("right", "left", "top", "bottom",
                                        "none")) {


  grid   <- match.arg(grid)
  axis   <- match.arg(axis)
  ticks  <- match.arg(ticks)
  legend <- match.arg(legend)

  # Set colours
  light_grey <- "#d9d9d9"

  # Use built in sans font
  afcharts_font <- "Arial"

  half_line <- base_size / 2
  base_line_size <- base_size / 24 * 3.7795 # Value in pixels
  pt_to_pixel <- 96 / 72

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
  title_text <- plotly::plotly_build(chart)$x$layout$title$text |> unclass()
  title_text_lines <- stringr::str_count(title_text, pattern = "\n")


  # set legend layout

  legend_layout <- switch(
    legend,
    "right" = list(
      orientation = "v",
      xref = "paper",
      xanchor = "left",
      x = 1.02,
      yref = "paper",
      yanchor = "middle",
      y = 0.5
    ),
    "left" = list(
      orientation = "v",
      xref = "paper",
      xanchor = "right",
      x = -0.02,
      yref = "paper",
      yanchor = "middle",
      y = 0.5
    ),
    "bottom" = list(
      orientation = "h",
      xref = "paper",
      xanchor = "center",
      x = 0.5,
      yref = "paper",
      yanchor = "top",
      y = -0.1
    ),
    "top" = list(
      orientation = "h",
      xref = "paper",
      xanchor = "center",
      x = 0.5,
      yref = "paper",
      yanchor = "bottom",
      y = 1.1
    )
  )

  chart |>
    plotly::layout(
      font = list(
        color = "black",
        size = base_size * pt_to_pixel,
        family = afcharts_font
      ),

      margin = list(
        b = 200,
        t = 200
      ),


      # title ------------------------------------------------------------------
      title = list(
        text = title_text,
        font = list(
          size = 1.6 * base_size * pt_to_pixel
        ),
        xref = "paper",
        yref = "paper",
        xanchor = "left",
        yanchor = "bottom",
        x = 0,
        y = 1,
        pad = list(b = ((half_line * 2) + base_size) * pt_to_pixel)
      ),


      # x axis -----------------------------------------------------------------

      xaxis = list(
        fixedrange = TRUE,
        automargin = FALSE,
        # title
        title = list(
          text = x_title,
          font = list(
            color = "black",
            size = base_size * pt_to_pixel,
            family = afcharts_font
          )
        ),

        # axis
        showline = axis_x,
        linecolor = light_grey,
        linewidth = base_line_size,

        # ticks
        ticks = ticks_x,
        tickcolor = light_grey,
        ticklen = half_line / 2 * pt_to_pixel,
        tickwidth = base_line_size,
        tickangle = 0,

        # grid
        showgrid = grid_x,
        gridwidth = base_line_size,
        gridcolor = light_grey
      ),


      # y axis -----------------------------------------------------------------

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
          size = base_size * pt_to_pixel
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
        linewidth = base_line_size,

        # ticks
        ticks = ticks_y,
        tickcolor = light_grey,
        ticklen = half_line / 2 * pt_to_pixel,
        tickwidth = base_line_size,
        tickangle = 0,

        # grid
        showgrid = grid_y,
        gridwidth = base_line_size,
        gridcolor = light_grey
      ),


      # Legend -----------------------------------------------------------------

      legend = legend_layout,


      # Hoverlabel -------------------------------------------------------------

      hoverlabel = list(
        bgcolor = "white",
        font = list(
          color = "black",
          size = base_size * pt_to_pixel,
          family = afcharts_font
        )
      )
    ) |>


    # Buttons ------------------------------------------------------------------
    plotly::config(
      displayModeBar = FALSE,
      scrollZoom = FALSE,
      displaylogo = FALSE
    )

}
