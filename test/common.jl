# test/common

using Serde

@testset "LWC_LINE_TYPES" begin
    @test Serde.SerJson.ser_type(AbstractChartSettings, LWC_SIMPLE) == 0
    @test Serde.SerJson.ser_type(AbstractChartSettings, LWC_STEP) == 1
end

@testset "LWC_LINE_STYLES" begin
    @test Serde.SerJson.ser_type(AbstractChartSettings, LWC_SOLID) == 0
    @test Serde.SerJson.ser_type(AbstractChartSettings, LWC_DOTTED) == 1
    @test Serde.SerJson.ser_type(AbstractChartSettings, LWC_DASHED) == 2
    @test Serde.SerJson.ser_type(AbstractChartSettings, LWC_LARGE_DASHED) == 3
    @test Serde.SerJson.ser_type(AbstractChartSettings, LWC_SPARSE_DOTTED) == 4
end

@testset "PRICE_SCALE_IDs" begin
    @test Serde.SerJson.ser_type(AbstractChartSettings, LWC_RIGHT) == "right"
    @test Serde.SerJson.ser_type(AbstractChartSettings, LWC_LEFT) == "left"
end

@testset "Data serialization" begin
    struct TestChart <: AbstractChartSettings
        data::LWCChartData
    end
    data =  TestChart(
        LWCChartData(TimeArray([
            TimeTick(1680086570373000000, LWCSimpleChartItem(1.0)),
            TimeTick(1680086571373000000, LWCSimpleChartItem(5.0)),
        ]))
    )
    result = "{\"data\":[[\"1680086570373000000\",{\"value\":1.0}],[\"1680086571373000000\",{\"value\":5.0}]]}"
    @test Serde.to_json(data) == result

    data =  TestChart(
        LWCChartData(TimeArray([
            TimeTick(1680086570373000000, LWCSimpleChartItem(NaN)),
            TimeTick(1680086571373000000, LWCSimpleChartItem(NaN)),
        ]))
    )
    result = "{\"data\":[[\"1680086570373000000\",{}],[\"1680086571373000000\",{}]]}"
    @test Serde.to_json(data) == result
end

@testset "to_camelcase()" begin
    @test LightweightCharts.to_camelcase("price_scale_id") == "priceScaleId"
    @test LightweightCharts.to_camelcase(:line_width) == :lineWidth
end
