# Colours

afcharts provides colour palettes as set out by the [Government Analysis
Function](https://analysisfunction.civilservice.gov.uk/policy-store/data-visualisation-colours-in-charts/).

These palettes have been developed to meet the [Web Content
Accessibility Guidelines 2.1 for graphical
objects](https://www.w3.org/WAI/WCAG21/Understanding/non-text-contrast.html).
The colours in the [main palette for categorical data](#main-palette)
all have at least a 3:1 colour contrast ratio with white (#ffffff), as
well as with adjacent colours in the palette.

## Things to consider when using colour

Using afcharts colour palettes does not guarantee that your charts will
be accessible. The [Government Analysis
Function](https://analysisfunction.civilservice.gov.uk/policy-store/data-visualisation-colours-in-charts/)
has published guidance on other steps you should take to ensure the
accessible use of colour. afcharts should be used in conjunction with
the advice given in these guidance documents.

The following are a few key things to consider when using colour in data
visualisations:

- Only use colour if absolutely necessary

- Do not rely on colour alone to communicate a message

- Use colour consistently when producing a series of plots

- Limit the number of different colours you use; ideally an absolute
  maximum of four

- Use colour palettes in the order presented to ensure adjacent colours
  have sufficient contrast with each other

## Government Analysis Function colour palettes

The Government Analysis Function guidance also contains [suggested
colour
palettes](https://analysisfunction.civilservice.gov.uk/policy-store/data-visualisation-colours-in-charts/#section-4).
These are provided in afcharts. To use an Analysis Function palette, set
`palette_type = "af"` when using any of the `scale_` [colour
functions](https://best-practice-and-impact.github.io/afcharts/reference/index.html#colours).

### Categorical palette

The `categorical` palette should be used with categorical data.

Note: the cells in the ‘Example of colour’ column may appear blank to
screen reader software. They contain a colour fill, but no data.

| Colour name  | Hex code | Example of colour |
|--------------|----------|-------------------|
| dark-blue    | \#12436D |                   |
| turquoise    | \#28A197 |                   |
| dark-pink    | \#801650 |                   |
| orange       | \#F46A25 |                   |
| dark-grey    | \#3D3D3D |                   |
| light-purple | \#A285D1 |                   |

The `categorical2` palette should be used if only two colours are
required as the dark blue and orange colours have the best colour
contrast with each other. If only two colours are required the
`categorical` family is requested, `categorical2` will be used instead.

Note: the cells in the ‘Example of colour’ column may appear blank to
screen reader software. They contain a colour fill, but no data.

| Colour name | Hex code | Example of colour |
|-------------|----------|-------------------|
| dark-blue   | \#12436D |                   |
| orange      | \#F46A25 |                   |

### Sequential palette

The `sequential` colour palette should be used for data where the order
has some meaning.

Note: the cells in the ‘Example of colour’ column may appear blank to
screen reader software. They contain a colour fill, but no data.

| Colour name   | Hex code | Example of colour |
|---------------|----------|-------------------|
| darkest-blue  | \#092135 |                   |
| dark-blue     | \#12436D |                   |
| mid-blue      | \#2073BC |                   |
| light-blue    | \#6BACE6 |                   |
| lightest-blue | \#ADD1F1 |                   |

As this palette is restricted to tints of one colour, there are issues
with colour contrast. Follow the [advice for using the sequential
palette](https://analysisfunction.civilservice.gov.uk/policy-store/data-visualisation-colours-in-charts/#section-6)
in the Government Analysis Function colour guidance when using this
palette.

### Focus palette

The `focus` palette should be used to highlight specific elements of a
plot.

Note: the cells in the ‘Example of colour’ column may appear blank to
screen reader software. They contain a colour fill, but no data.

| Colour name | Hex code | Example of colour |
|-------------|----------|-------------------|
| dark-blue   | \#12436D |                   |
| grey        | \#BFBFBF |                   |

The light grey colour in this palette does not have sufficient colour
contrast against a white background and therefore this palette should
only be used when it is essential to communicate your message. Follow
the [advice for using the focus
palette](https://analysisfunction.civilservice.gov.uk/policy-store/data-visualisation-colours-in-charts/#section-7)
in the Government Analysis Function colour guidance when using this
palette.

## Using your own colour palette

There may be instances where you’d like to use a different colour
palette. If so, this should be carefully considered to ensure it meets
accessibility requirements. The Government Analysis Function guidance
outlines [appropriate steps for choosing your own accessible colour
palette](https://analysisfunction.civilservice.gov.uk/policy-store/data-visualisation-colours-in-charts/#section-9)
and should be used.

An example of how to use an alternative colour palette is provided in
the
[cookbook](https://best-practice-and-impact.github.io/afcharts/articles/cookbook.html#using-your-own-colour-palette).
However, if you use a different palette regularly and feel it would be
useful for this to be added to afcharts, please make a suggestion as per
the [contributing
guidance](https://best-practice-and-impact.github.io/afcharts/CONTRIBUTING.html).

## Viewing Palettes in R

Names and hex codes for available colours and palettes can be viewed by
running the following code:

``` r
# View names and hex codes for all colours
afcharts::af_colour_values

# View names and hex codes for all colour palettes
afcharts::af_colour_palettes

# View names and hex codes for `categorical` colour palette
afcharts::af_colour_palettes$categorical
```

Examples of how to apply these palettes to ggplot2 charts are available
in both the
[cookbook](https://best-practice-and-impact.github.io/afcharts/articles/cookbook.html)
and the reference files for `scale_` [colour
functions](https://best-practice-and-impact.github.io/afcharts/reference/index.html#colours).
