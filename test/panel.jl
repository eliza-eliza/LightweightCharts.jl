# test/panel

@testset "Panel" begin
    panel_board = lwc_panel(
        name = "panel",
        seconds_visible = true,
        bar_spacing = 4,
        min_bar_spacing = 1.5,
        lwc_line(
            Vector{DateTime}([
                DateTime("2023-03-29T10:42:50.373"),
                DateTime("2023-03-29T10:42:51.373"),
                DateTime("2023-03-29T10:42:52.373"),
                DateTime("2023-03-29T10:42:52.373"),
                DateTime("2023-03-29T10:42:53.373"),
                DateTime("2023-03-29T10:42:54.373"),
            ]),
            Vector{Real}([1, 5, 2, 2, 3, 4]);
            label_name = "OK.ICX-USDT",
            line_color = "red",
            plugins = [
                lwc_vert_line(
                    3;
                    color = "red",
                    label_text = "test",
                    width = 1.5,
                    label_background_color = "green",
                    label_text_color = "white",
                    show_label = true,
                ),
            ],
        ),
    )

    result = lwc_panel(
        name = "panel",
        seconds_visible = true,
        bar_spacing = 4,
        min_bar_spacing = 1.5,
        copyright = true,
        tooltip = true,
        tooltip_format = "\${label_name}: (\${time}, \${value})",
        LWCChart(;
            id = panel_board.charts[1].id,
            label_name = "OK.ICX-USDT",
            label_color = "red",
            type = "addLineSeries",
            settings = LightweightCharts.Charts.LineChartSettings(
                LWC_LEFT,
                "OK.ICX-USDT",
                true,
                2,
                "red",
                LWC_SOLID,
                1,
                LWC_SIMPLE,
                true,
                false,
                4.0,
                true,
                4.0,
                "",
                "",
                2.0,
            ),
            data = LWCChartData(TimeArray([
                TimeTick(1680086570373_000000, LWCSimpleChartItem(1.0)),
                TimeTick(1680086571373_000000, LWCSimpleChartItem(5.0)),
                TimeTick(1680086572373_000000, LWCSimpleChartItem(2.0)),
                TimeTick(1680086573373_000000, LWCSimpleChartItem(3.0)),
                TimeTick(1680086574373_000000, LWCSimpleChartItem(4.0)),
            ])),
            plugins = Vector{LWCPlugin}([
                LWCPlugin(
                    "addVertLine",
                    LightweightCharts.Plugins.VertLineSettings(
                        3,
                        "red",
                        "test",
                        1.5,
                        "green",
                        "white",
                        true,
                    ),
                ),
            ]),
        ),
    )
    
    @test panel_board == result
end


@testset "Union timestamp grid" begin
    panel_board = lwc_panel(
        name = "panel",
        seconds_visible = true,
        bar_spacing = 4,
        min_bar_spacing = 1.5,
        lwc_line(
            Vector{DateTime}([
                DateTime("2023-03-29T10:42:50.373"),
                DateTime("2023-03-29T10:42:51.373"),
                DateTime("2023-03-29T10:42:53.373"),
            ]),
            Vector{Real}([1, 5, 2]);
            label_name = "OK.ICX-USDT1",
            line_color = "red",
            plugins = [
                lwc_vert_line(
                    3;
                    color = "red",
                    label_text = "test",
                    width = 1.5,
                    label_background_color = "green",
                    label_text_color = "white",
                    show_label = true,
                ),
            ],
        ),
        lwc_line(
            Vector{DateTime}([
                DateTime("2023-03-29T10:42:50.373"),
                DateTime("2023-03-29T10:42:52.373"),
                DateTime("2023-03-29T10:42:54.373"),
            ]),
            Vector{Real}([2, 3, 4]);
            label_name = "OK.ICX-USDT2",
            line_color = "red",
            plugins = [
                lwc_vert_line(
                    3;
                    color = "red",
                    label_text = "test",
                    width = 1.5,
                    label_background_color = "green",
                    label_text_color = "white",
                    show_label = true,
                ),
            ],
        ),
    )

    result = lwc_panel(
        name = "panel",
        seconds_visible = true,
        bar_spacing = 4,
        min_bar_spacing = 1.5,
        copyright = true,
        tooltip = true,
        tooltip_format = "\${label_name}: (\${time}, \${value})",
        LWCChart(;
            id = panel_board.charts[1].id,
            label_name = "OK.ICX-USDT1",
            label_color = "red",
            type = "addLineSeries",
            settings = LightweightCharts.Charts.LineChartSettings(
                LWC_LEFT,
                "OK.ICX-USDT1",
                true,
                2,
                "red",
                LWC_SOLID,
                1,
                LWC_SIMPLE,
                true,
                false,
                4.0,
                true,
                4.0,
                "",
                "",
                2.0,
            ),
            data = LWCChartData(TimeArray([
                TimeTick(1680086570373_000000, LWCSimpleChartItem(1.0)),
                TimeTick(1680086571373_000000, LWCSimpleChartItem(5.0)),
                TimeTick(1680086572373_000000, LWCSimpleChartItem(5.0)),
                TimeTick(1680086573373_000000, LWCSimpleChartItem(2.0)),
                TimeTick(1680086574373_000000, LWCSimpleChartItem(2.0)),
            ])),
            plugins = Vector{LWCPlugin}([
                LWCPlugin(
                    "addVertLine",
                    LightweightCharts.Plugins.VertLineSettings(
                        3,
                        "red",
                        "test",
                        1.5,
                        "green",
                        "white",
                        true,
                    ),
                ),
            ]),
        ),
        LWCChart(;
            id = panel_board.charts[2].id,
            label_name = "OK.ICX-USDT2",
            label_color = "red",
            type = "addLineSeries",
            settings = LightweightCharts.Charts.LineChartSettings(
                LWC_LEFT,
                "OK.ICX-USDT2",
                true,
                2,
                "red",
                LWC_SOLID,
                1,
                LWC_SIMPLE,
                true,
                false,
                4.0,
                true,
                4.0,
                "",
                "",
                2.0,
            ),
            data = LWCChartData(TimeArray([
                TimeTick(1680086570373_000000, LWCSimpleChartItem(2.0)),
                TimeTick(1680086571373_000000, LWCSimpleChartItem(2.0)),
                TimeTick(1680086572373_000000, LWCSimpleChartItem(3.0)),
                TimeTick(1680086573373_000000, LWCSimpleChartItem(3.0)),
                TimeTick(1680086574373_000000, LWCSimpleChartItem(4.0)),
            ])),
            plugins = Vector{LWCPlugin}([
                LWCPlugin(
                    "addVertLine",
                    LightweightCharts.Plugins.VertLineSettings(
                        3,
                        "red",
                        "test",
                        1.5,
                        "green",
                        "white",
                        true,
                    ),
                ),
            ]),
        ),
    )
    
    @test panel_board == result
end
