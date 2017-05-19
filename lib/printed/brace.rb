class Brace < SolidRuby::Printed
  def initialize(args={})
    @brace_width = args[:brace_width] || 1
    @brace_depth = args[:brace_depth] || 1
    @total_height = args[:total_height] || 1
    @segments = args[:segments] || 1
    @top_span_ratio = args[:top_span_ratio] || 2
  end

  def part(_show)
    res = nil
    seg_height = (@total_height) / @segments
    seg_height += @brace_width if segments == 1
    seg_height += 1.5 #overlap with layer above
    (0...@segments).each do |seg|

      brace_height = Math.sqrt(seg_height**2 + seg_height**2)

      base = Math.sqrt(brace_height**2 - seg_height**2)
      true_height = Math.sqrt((seg_height-1)**2 + (base)**2)

      profile =polygon(points:[
        [0,0],
        [seg_height,seg_height],
        [seg_height,seg_height+@brace_width*@top_span_ratio],
        [0,(seg_height+@brace_width)*2],
        [0,(seg_height*2)+@brace_width],
        [seg_height-@brace_width,seg_height+@brace_width*@top_span_ratio],
        [seg_height-@brace_width,seg_height],
        [0,@brace_width],
        [0,0]
      ])
      brace = profile
        .linear_extrude(height:@brace_depth)
        .rotate(y: -90)

      #puts triangle(b: @brace_width, c: @brace_depth, beta: 90).inspect

      brace += triangle(a: @brace_width, c: @brace_depth, beta: 90)
        .linear_extrude(height: @brace_width*@top_span_ratio)
        .rotate(x: 90)
        .translate(x: -@brace_depth, y: (seg_height+@brace_width) + ((@brace_width*@top_span_ratio) / 2.0), z: seg_height)

      # profile = polygon(points: [
      #   [0,0],
      #   [@brace_depth,-@brace_depth],
      #   [@brace_depth,0],
      #   [0,0]
      #   ]);
      # brace += profile
      #   .linear_extrude(height: @brace_width*@top_span_ratio)
      #   .rotate(y: 90, x: 90)
      #   .translate(y: seg_height+(@brace_width*@top_span_ratio), z: @brace_depth+seg_height)

      if seg % 2 == 1
        brace.rotate(y: 180)
          .translate(z: seg_height, x: -@brace_width)
      end

      res += brace
        .translate(x: @brace_depth/2.0, y: -(seg_height+(@brace_width*@top_span_ratio/2.0)))
        .translate(z: seg * seg_height)
    end
    res
  end
end
