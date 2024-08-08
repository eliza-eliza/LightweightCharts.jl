module ChartData

export lwc_time,
    lwc_value,
    lwc_open,
    lwc_high,
    lwc_close,
    lwc_low

export LWCChartData,
    LWCSimpleChartItem,
    LWCCandleChartItem

export to_lwc_data,
    prepare_data

using Dates
using Serde
using NanoDates
using TimeArrays

using ..LightweightCharts

"""
    LWCSimpleChartItem(time::Int64, value::Real; kw...)
    LWCSimpleChartItem(time::TimeType, value::Real; kw...)

This data type allows you to customize the colors for each point of your chart.
Supported for [`lwc_line`](@ref), [`lwc_area`](@ref), [`lwc_baseline`](@ref) and [`lwc_histogram`](@ref) methods.

## Fields
- `time::Int64`: Data unix time.
- `value::Float64`: Data value.

## Keyword arguments
| Name::Type | Default (Possible values) | Description |
|:-----------|:-------------------------|:------------|
| `line_color::String` | `nothing` | Line color. |
| `top_color::String` | `nothing` | Top color. |
| `bottom_color::String` | `nothing` | Bottom color. |
| `top_fill_color_1::String` | `nothing` | Top fill color 1. |
| `top_fill_color_2::String` | `nothing` | Top fill color 2. |
| `top_line_color::String` | `nothing` | Top line color. |
| `bottom_fill_color_1::String` | `nothing` | Bottom fill color 1. |
| `bottom_fill_color_2::String` | `nothing` | Bottom fill color 2. |
| `bottom_line_color::String` | `nothing` | Bottom line color. |
| `color::String` | `nothing` | Color. |
"""
mutable struct LWCSimpleChartItem <: AbstractChartItem
    value::Float64
    line_color::Union{String,Nothing}
    top_color::Union{String,Nothing}
    bottom_color::Union{String,Nothing}
    top_fill_color_1::Union{String,Nothing}
    top_fill_color_2::Union{String,Nothing}
    top_line_color::Union{String,Nothing}
    bottom_fill_color_1::Union{String,Nothing}
    bottom_fill_color_2::Union{String,Nothing}
    bottom_line_color::Union{String,Nothing}
    color::Union{String,Nothing}

    function LWCSimpleChartItem(
        value::Real;
        line_color::Union{String,Nothing} = nothing,
        top_color::Union{String,Nothing} = nothing,
        bottom_color::Union{String,Nothing} = nothing,
        top_fill_color_1::Union{String,Nothing} = nothing,
        top_fill_color_2::Union{String,Nothing} = nothing,
        top_line_color::Union{String,Nothing} = nothing,
        bottom_fill_color_1::Union{String,Nothing} = nothing,
        bottom_fill_color_2::Union{String,Nothing} = nothing,
        bottom_line_color::Union{String,Nothing} = nothing,
        color::Union{String,Nothing} = nothing,
    )
        return new(
            value,
            line_color,
            top_color,
            bottom_color,
            top_fill_color_1,
            top_fill_color_2,
            top_line_color,
            bottom_fill_color_1,
            bottom_fill_color_2,
            bottom_line_color,
            color,
        )
    end
end

lwc_value(x::LWCSimpleChartItem) = x.value
lwc_line_color(x::LWCSimpleChartItem) = x.line_color
lwc_top_color(x::LWCSimpleChartItem) = x.top_color
lwc_bottom_color(x::LWCSimpleChartItem) = x.bottom_color
lwc_top_fill_color_1(x::LWCSimpleChartItem) = x.top_fill_color_1
lwc_top_fill_color_2(x::LWCSimpleChartItem) = x.top_fill_color_2
lwc_top_line_color(x::LWCSimpleChartItem) = x.top_line_color
lwc_bottom_fill_color_1(x::LWCSimpleChartItem) = x.bottom_fill_color_1
lwc_bottom_fill_color_2(x::LWCSimpleChartItem) = x.bottom_fill_color_2
lwc_bottom_line_color(x::LWCSimpleChartItem) = x.bottom_line_color
lwc_color(x::LWCSimpleChartItem) = x.color

Serde.SerJson.ser_value(::Type{<:AbstractChartItem}, ::Val{:time}, x::Int64) = string(x)

function Base.:(==)(left::LWCSimpleChartItem, right::LWCSimpleChartItem)
    return isequal(lwc_value(left), lwc_value(right))
end

function Base.zero(::Type{LWCSimpleChartItem})
    return LWCSimpleChartItem(0)
end

function Base.:(*)(left::Real, right::LWCSimpleChartItem)
    return left * right.value
end

function Base.:(+)(left::Real, right::LWCSimpleChartItem)
    return LWCSimpleChartItem(
        left + right.value;
        right.line_color,
        right.top_color,
        right.bottom_color,
        right.top_fill_color_1,
        right.top_fill_color_2,
        right.top_line_color,
        right.bottom_fill_color_1,
        right.bottom_fill_color_2,
        right.bottom_line_color,
        right.color,
    )
end

Base.isnan(x::LWCSimpleChartItem) = isnan(x.value)

TimeArrays.ta_nan(::Type{LWCSimpleChartItem}) = LWCSimpleChartItem(NaN)

"""
    LWCCandleChartItem(time::Int64, open::Real, high::Real, low::Real, close::Real; kw...)
    LWCCandleChartItem(time::TimeType, open::Real, high::Real, low::Real, close::Real; kw...)

Representation of candlestick data for [`lwc_candlestick`](@ref) and [`lwc_bar`](@ref) methods.

## Fields
- `time::Int64`
- `open::Float64`
- `high::Float64`
- `low::Float64`
- `close::Float64`

## Keyword arguments
| Name::Type | Default (Possible values) | Description |
|:-----------|:-------------------------|:------------|
| `color::String` | `nothing` | Candle color. |
| `border_color::String` | `nothing` | Border color. |
| `wick_color::String` | `nothing` | Wick color. |
"""
mutable struct LWCCandleChartItem <: AbstractChartItem
    open::Float64
    high::Float64
    low::Float64
    close::Float64
    color::Union{String,Nothing}
    border_color::Union{String,Nothing}
    wick_color::Union{String,Nothing}

    function LWCCandleChartItem(
        open::Real,
        high::Real,
        low::Real,
        close::Real;
        color::Union{String,Nothing} = nothing,
        border_color::Union{String,Nothing} = nothing,
        wick_color::Union{String,Nothing} = nothing,
    )
        return new(
            open,
            high,
            low,
            close,
            color,
            border_color,
            wick_color,
        )
    end
end

lwc_open(x::LWCCandleChartItem) = x.open
lwc_high(x::LWCCandleChartItem) = x.high
lwc_low(x::LWCCandleChartItem) = x.low
lwc_close(x::LWCCandleChartItem) = x.close
lwc_color(x::LWCCandleChartItem) = x.color
lwc_border_color(x::LWCCandleChartItem) = x.border_color
lwc_wick_color(x::LWCCandleChartItem) = x.wick_color

function Base.:(==)(left::LWCCandleChartItem, right::LWCCandleChartItem)
    return (
        isequal(lwc_open(left), lwc_open(right)) &&
        isequal(lwc_high(left), lwc_high(right)) &&
        isequal(lwc_low(left), lwc_low(right))   &&
        isequal(lwc_close(left), lwc_close(right))
    )
end

function Base.zero(::Type{LWCCandleChartItem})
    return LWCCandleChartItem(0, 0, 0, 0)
end

function Base.:(*)(left::Real, right::LWCCandleChartItem)
    return left * right.close
end

function Base.:(+)(left::Real, right::LWCCandleChartItem)
    return LWCCandleChartItem(
        left + right.open, 
        left + right.high, 
        left + right.low, 
        left + right.close;
        right.color,
        right.border_color,
        right.wick_color,
    )
end

Base.isnan(x::LWCCandleChartItem) = isnan(x.open) && isnan(x.high) && isnan(x.low) && isnan(x.close)

TimeArrays.ta_nan(::Type{LWCCandleChartItem}) = LWCCandleChartItem(NaN, NaN, NaN, NaN)

const UNIXEPOCH_NS = Dates.UNIXEPOCH * Int128(1_000_000)

datetime2epochns(x::DateTime)::Int64 = (Dates.value(x) - Dates.UNIXEPOCH) * 1_000_000
datetime2epochns(x::Date)::Int64     = datetime2epochns(DateTime(x))
datetime2epochns(x::NanoDate)::Int64 = Dates.value(x) - UNIXEPOCH_NS
datetime2epochns(x::Real)::Int64     = x * 1_000_000_000

mutable struct LWCChartData{T<:AbstractChartItem} <: AbstractVector{T}
    data::TimeArray{Int64,T}

    function LWCChartData(data::TimeArray{Int64,T}) where {T<:AbstractChartItem}
        i = unique(i -> ta_timestamp(data[i]), eachindex(data))
        return new{T}(data[i])
    end
end

Base.size(x::LWCChartData) = size(x.data)
Base.length(x::LWCChartData) = length(x.data)
Base.getindex(x::LWCChartData, i::Integer) = getindex(x.data, i)
Base.convert(::Type{LWCChartData}, x::LWCChartData) = x

function Base.convert(::Type{LWCChartData}, x::TimeArray{Int64,<:AbstractChartItem})
    return LWCChartData(x)
end

#__ ChartItem

Base.convert(::Type{<:AbstractChartItem}, x::TimeTick{Int64,AbstractChartItem}) = x

function Base.convert(::Type{<:AbstractChartItem}, x::Tuple)
    return throw(ErrorException("Incorrect conversion from custom type object to Tuple."))
end

function Base.convert(::Type{T}, x::Any) where {T<:AbstractChartItem}
    return convert(T, convert(Tuple, x))
end

function Base.convert(::Type{LWCSimpleChartItem}, x::Tuple{<:Union{Real,TimeType},<:Real})
    timestamp, value = x
    return TimeTick(datetime2epochns(timestamp), LWCSimpleChartItem(value))
end

function Base.convert(
    ::Type{LWCCandleChartItem},
    x::Tuple{D,O,H,L,C},
) where {D<:Union{Real,TimeType},O<:Real,H<:Real,L<:Real,C<:Real}
    timestamp, open, high, low, close = x
    return TimeTick(datetime2epochns(timestamp), LWCCandleChartItem(open, high, low, close))
end

function to_lwc_data(::Type{T}, data::AbstractVector) where {T<:AbstractChartItem}
    return TimeArray(map(item -> convert(T, item), data))
end

function to_lwc_data(
    ::Type{LWCSimpleChartItem},
    timestamps::AbstractVector{<:Union{Real,TimeType}},
    values::AbstractVector{<:Real},
)
    @assert length(timestamps) === length(values) "length(timestamps) ≠ length(values)"

    return TimeArray(map(timestamps, values) do timestamp, value
        return TimeTick(datetime2epochns(timestamp), LWCSimpleChartItem(value))
    end)
end

function to_lwc_data(::Type{LWCSimpleChartItem}, values::AbstractVector{<:Real})
    return TimeArray(map(enumerate(values)) do item
        i, value = item
        return TimeTick(datetime2epochns(DateTime(1970) + Second(i)), LWCSimpleChartItem(value))
    end)
end

function to_lwc_data(
    ::Type{LWCCandleChartItem},
    timestamps::AbstractVector{<:Union{Real,TimeType}},
    open::AbstractVector{<:Real},
    high::AbstractVector{<:Real},
    low::AbstractVector{<:Real},
    close::AbstractVector{<:Real},
)
    @assert length(timestamps) === length(open) "length(timestamps) ≠ length(open)"
    @assert length(timestamps) === length(high) "length(timestamps) ≠ length(high)"
    @assert length(timestamps) === length(low) "length(timestamps) ≠ length(low)"
    @assert length(timestamps) === length(close) "length(timestamps) ≠ length(close)"

    return TimeArray(map(timestamps, open, high, low, close) do t, o, h, l, c
        return TimeTick(datetime2epochns(t), LWCCandleChartItem(o, h, l, c))
    end)
end

end
