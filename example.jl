using Serde
using LightweightCharts
using NanoDates
using Dates
using TimeArrays

prices = ta_price_sample_data()

panel = lwc_panel(
    lwc_line(
        prices[200:500];
        label_name = "Buys",
        line_color = "green",
        point_markers_visible = true,
        line_visible = false,
        precision = 5,
    ),
    lwc_line(
        prices;
        label_name = "Sells",
        line_color = "red",
        point_markers_visible = true,
        line_visible = false,
        precision = 5,
    );
    min_bar_spacing = 0.005,
    name = "LightweightCharts ❤️ TimeArrays",
)

lwc_show(panel)

using TimeArrays
Serde.SerJson.ser_name(::Type{TimeTick}, ::Val{timestamp}) = :time

a = TimeTick(213213123, 23)

Serde.to_json(a)




using TimeArrays

a = TimeArray{DateTime,Float64}([
    TimeTick(DateTime("2024-01-01"), 1.0),
    TimeTick(DateTime("2024-01-05"), 2.0),
    TimeTick(DateTime("2024-01-07"), 5.0),
])

b = TimeArray{DateTime,Float64}([
    (DateTime("2024-01-01"), 1.0),
    (DateTime("2024-01-02"), 2.0),
    (DateTime("2024-01-03"), 4.0),
    (DateTime("2024-01-04"), 5.0),
    (DateTime("2024-01-05"), 6.0),
    (DateTime("2024-01-06"), 7.0),
    (DateTime("2024-01-07"), 7.0),
    (DateTime("2024-01-08"), 7.0),
    (DateTime("2024-01-15"), 7.0),
])

c = TimeArray{DateTime,Float64}([
    (DateTime("2024-01-01"), 1.0),
    (DateTime("2024-01-02"), 2.0),
    (DateTime("2024-01-03"), 4.0),
    (DateTime("2024-01-04"), 5.0),
    (DateTime("2024-01-05"), 6.0),
    (DateTime("2024-01-06"), 7.0),
    (DateTime("2024-01-06"), 7.0),
    (DateTime("2024-01-07"), 7.0),
    (DateTime("2024-01-08"), 7.0),
    (DateTime("2024-01-09"), 7.0),
    (DateTime("2024-01-10"), 7.0),
    (DateTime("2024-01-11"), 7.0),
])


panel = lwc_panel(
    lwc_line(
        a;
        label_name = "Buys",
        line_color = "green",
        point_markers_visible = true,
        line_visible = false,
        precision = 5,
        price_scale_id = LWC_RIGHT,
    ),
    lwc_line(
        b;
        label_name = "Sells",
        line_color = "red",
        point_markers_visible = true,
        line_visible = false,
        precision = 5,
        price_scale_id = LWC_RIGHT,
    ),
    lwc_line(
        c;
        label_name = "None",
        line_color = "blue",
        point_markers_visible = true,
        line_visible = false,
        precision = 5,
        price_scale_id = LWC_RIGHT,
    );
    min_bar_spacing = 0.005,
    name = "LightweightCharts ❤️ TimeArrays",
)

panel.charts[3].data.data

lwc_show(panel)


using Serde
Serde.SerJson.ser_name(::Type{TimeTick}, ::Val{:timestamp}) = :time
Serde.SerJson.ser_value(:Type{})
to_json(TimeTick(1412, 1))