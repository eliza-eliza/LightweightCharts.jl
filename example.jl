using Dates, NanoDates
using LightweightCharts

using IJulia
notebook()

layout = lwc_layout(
    lwc_panel(
        lwc_line(
            NanoDate("2024-01-01") .+ Second.(1:500),
            map(x -> rand(1:500), collect(1:500));
            label_name = "line1",
            line_style = LWC_DASHED,
            line_type = LWC_SIMPLE,
            line_width = 3,
            price_scale_id = LWC_RIGHT,
        ),
        lwc_line(
            NanoDate("2024-01-01") .+ Second.(1:500),
            map(x -> rand(50:1000), collect(1:500));
            label_name = "line2",
            line_style = LWC_DASHED,
            line_type = LWC_SIMPLE,
            line_width = 3,
            price_scale_id = LWC_RIGHT,
        ),
        lwc_line(
            NanoDate("2024-01-01") .+ Second.(1:500),
            map(x -> rand(50:1000), collect(1:500));
            label_name = "line3",
            line_style = LWC_DASHED,
            line_type = LWC_SIMPLE,
            line_width = 3,
            price_scale_id = LWC_RIGHT,
        ),
        lwc_line(
            NanoDate("2024-01-01") .+ Second.(1:500),
            map(x -> rand(50:1000), collect(1:500));
            label_name = "line4",
            line_style = LWC_DASHED,
            line_type = LWC_SIMPLE,
            line_width = 3,
            price_scale_id = LWC_RIGHT,
        ),
        lwc_line(
            NanoDate("2024-01-01") .+ Second.(1:500),
            map(x -> rand(50:1000), collect(1:500));
            label_name = "line5",
            line_style = LWC_DASHED,
            line_type = LWC_SIMPLE,
            line_width = 3,
            price_scale_id = LWC_RIGHT,
        ),
        lwc_line(
            NanoDate("2024-01-01") .+ Second.(1:500),
            map(x -> rand(50:1000), collect(1:500));
            label_name = "line6",
            line_style = LWC_DASHED,
            line_type = LWC_SIMPLE,
            line_width = 3,
            price_scale_id = LWC_RIGHT,
        ),
        lwc_line(
            NanoDate("2024-01-01") .+ Second.(1:500),
            map(x -> rand(50:1000), collect(1:500));
            label_name = "line7",
            line_style = LWC_DASHED,
            line_type = LWC_SIMPLE,
            line_width = 3,
            price_scale_id = LWC_RIGHT,
        ),
        lwc_line(
            NanoDate("2024-01-01") .+ Second.(1:500),
            map(x -> rand(50:1000), collect(1:500));
            label_name = "line8",
            line_style = LWC_DASHED,
            line_type = LWC_SIMPLE,
            line_width = 3,
            price_scale_id = LWC_RIGHT,
        ),
        lwc_line(
            NanoDate("2024-01-01") .+ Second.(1:500),
            map(x -> rand(50:1000), collect(1:500));
            label_name = "line9",
            line_style = LWC_DASHED,
            line_type = LWC_SIMPLE,
            line_width = 3,
            price_scale_id = LWC_RIGHT,
        ),
        lwc_line(
            NanoDate("2024-01-01") .+ Second.(1:500),
            map(x -> rand(50:1000), collect(1:500));
            label_name = "line10",
            line_style = LWC_DASHED,
            line_type = LWC_SIMPLE,
            line_width = 3,
            price_scale_id = LWC_RIGHT,
        );
        x = 1,
        y = 1,
    ),
    lwc_panel(
        lwc_baseline(
            NanoDate("2024-01-01") .+ Second.(1:500),
            map(x -> rand(1:500), collect(1:500));
            label_name = "lwc_baseline",
            base_value = LWCBaseValue("price", 250),
            line_style = LWC_SOLID,
            line_type = LWC_CURVED,
            line_width = 3,
            precision = 4,
            price_scale_id = LWC_RIGHT,
        );
        tooltip = false,
        x = 2,
        y = 1,
    ),
    lwc_panel(
        lwc_area(
            NanoDate("2024-01-01") .+ Second.(1:500),
            map(x -> rand(1:500), collect(1:500));
            label_name = "lwc_area",
            line_color = "#49c7e3",
            top_color = "#74d7ed",
            bottom_color = "#85f2f000",
            line_style = LWC_SOLID,
            line_type = LWC_STEP,
            line_width = 2,
            precision = 3,
            price_scale_id = LWC_LEFT,
        ),
        lwc_line(
            NanoDate("2024-01-01") .+ Second.(1:500),
            map(x -> rand(1:500), collect(1:500));
            label_name = "lwc_line",
            line_color = "#ff5752",
            line_style = LWC_DASHED,
            line_type = LWC_SIMPLE,
            line_width = 3,
            price_scale_id = LWC_RIGHT,
        );
        x = 1,
        y = 2,
    ),
    lwc_panel(
        lwc_line(
            NanoDate("2024-01-01") .+ Second.(1:500),
            map(x -> rand(1:500), collect(1:500));
            label_name = "line1",
            line_style = LWC_DASHED,
            line_type = LWC_SIMPLE,
            line_width = 3,
            price_scale_id = LWC_RIGHT,
        ),
        lwc_line(
            NanoDate("2024-01-01") .+ Second.(1:500),
            map(x -> rand(50:1000), collect(1:500));
            label_name = "line2",
            line_style = LWC_DASHED,
            line_type = LWC_SIMPLE,
            line_width = 3,
            price_scale_id = LWC_RIGHT,
        ),
        lwc_line(
            NanoDate("2024-01-01") .+ Second.(1:500),
            map(x -> rand(50:1000), collect(1:500));
            label_name = "line3",
            line_style = LWC_DASHED,
            line_type = LWC_SIMPLE,
            line_width = 3,
            price_scale_id = LWC_RIGHT,
        ),
        lwc_line(
            NanoDate("2024-01-01") .+ Second.(1:500),
            map(x -> rand(50:1000), collect(1:500));
            label_name = "line4",
            line_style = LWC_DASHED,
            line_type = LWC_SIMPLE,
            line_width = 3,
            price_scale_id = LWC_RIGHT,
        ),
        lwc_line(
            NanoDate("2024-01-01") .+ Second.(1:500),
            map(x -> rand(50:1000), collect(1:500));
            label_name = "line5",
            line_style = LWC_DASHED,
            line_type = LWC_SIMPLE,
            line_width = 3,
            price_scale_id = LWC_RIGHT,
        ),
        lwc_line(
            NanoDate("2024-01-01") .+ Second.(1:500),
            map(x -> rand(50:1000), collect(1:500));
            label_name = "line6",
            line_style = LWC_DASHED,
            line_type = LWC_SIMPLE,
            line_width = 3,
            price_scale_id = LWC_RIGHT,
        ),
        lwc_line(
            NanoDate("2024-01-01") .+ Second.(1:500),
            map(x -> rand(50:1000), collect(1:500));
            label_name = "line7",
            line_style = LWC_DASHED,
            line_type = LWC_SIMPLE,
            line_width = 3,
            price_scale_id = LWC_RIGHT,
        ),
        lwc_line(
            NanoDate("2024-01-01") .+ Second.(1:500),
            map(x -> rand(50:1000), collect(1:500));
            label_name = "line8",
            line_style = LWC_DASHED,
            line_type = LWC_SIMPLE,
            line_width = 3,
            price_scale_id = LWC_RIGHT,
        ),
        lwc_line(
            NanoDate("2024-01-01") .+ Second.(1:500),
            map(x -> rand(50:1000), collect(1:500));
            label_name = "line9",
            line_style = LWC_DASHED,
            line_type = LWC_SIMPLE,
            line_width = 3,
            price_scale_id = LWC_RIGHT,
        ),
        lwc_line(
            NanoDate("2024-01-01") .+ Second.(1:500),
            map(x -> rand(50:1000), collect(1:500));
            label_name = "line10",
            line_style = LWC_DASHED,
            line_type = LWC_SIMPLE,
            line_width = 3,
            price_scale_id = LWC_RIGHT,
        );
        x = 2,
        y = 2,
    ),
    lwc_panel(
        lwc_baseline(
            NanoDate("2024-01-01") .+ Second.(1:500),
            map(x -> rand(1:500), collect(1:500));
            label_name = "lwc_baseline",
            base_value = LWCBaseValue("price", 250),
            line_style = LWC_SOLID,
            line_type = LWC_CURVED,
            line_width = 3,
            precision = 4,
            price_scale_id = LWC_RIGHT,
        );
        tooltip = true,
        x = 1,
        y = 3,
    ),
    lwc_panel(
        lwc_baseline(
            NanoDate("2024-01-01") .+ Second.(1:500),
            map(x -> rand(1:500), collect(1:500));
            label_name = "lwc_baseline",
            base_value = LWCBaseValue("price", 250),
            line_style = LWC_SOLID,
            line_type = LWC_CURVED,
            line_width = 3,
            precision = 4,
            price_scale_id = LWC_RIGHT,
        );
        tooltip = true,
        x = 2,
        y = 3,
    ),
    lwc_panel(
        lwc_baseline(
            NanoDate("2024-01-01") .+ Second.(1:500),
            map(x -> rand(1:500), collect(1:500));
            label_name = "lwc_baseline",
            base_value = LWCBaseValue("price", 250),
            line_style = LWC_SOLID,
            line_type = LWC_CURVED,
            line_width = 3,
            precision = 4,
            price_scale_id = LWC_RIGHT,
        );
        tooltip = true,
        x = 3,
        y = 3,
    );
    name = "LightweightCharts ❤️ Julia"
)

lwc_show(layout)



using Dates
using LightweightCharts

open_time = now() .+ Second.(1:500)
x_values = map(x -> sin(2rand() + x / 10), 1:500)

chart = lwc_panel(
    lwc_candlestick(
        LWCCandleChartItem.(
            open_time,
            x_values,
            x_values .+ rand(500),
            x_values .- rand(500),
            [x_values[2:end]..., x_values[begin]],
        );
        label_name = "lwc_candlestick",
        up_color = "#52a49a",
        down_color = "#de5e57",
        border_visible = false,
        price_scale_id = LWC_RIGHT,
    ),
    tooltip_format = "\${title}: \${value}",
)

lwc_show(chart)