class Holder < SolidRuby::Printed
  def initialize(args={})
    @lid_diam = args[:diam] || 110
    @lid_height = args[:height] || 60
    @segments = args[:segments] || 3

    @brace_size = 5 #brace is 3x3

    # work out brace length
    w = @lid_diam
    l = @lid_diam + (@brace_size)
    @full_cross_len = Math.sqrt((w/2.0)**2 + l**2)

  end

  def part(_show)
    w = (@lid_diam/2.0)+@brace_size/2.0
    l = @lid_diam + (@brace_size*2)
    res = cube(@brace_size, l, @brace_size)
      .center_xy
      .translate(x: -w)

    res += cube(@brace_size, l, @brace_size)
      .center_xy
      .translate(x: w)

    # res += cube(@brace_size, l, @brace_size)
    #   .center_xy
    #   .rotate(z: 90)
    #   .translate(y: -w)

    res += cube(@brace_size, l, @brace_size)
      .center_xy
      .rotate(z: 90)
      .translate(y: w)

    t = triangle(a: l/2.0, c: l, beta: 90)

    #bottom brace
    res += cube(@brace_size, @full_cross_len, @brace_size)
      .center_xy
      .rotate(z: t.alpha)
      .translate(x: w/2.0)

    res += cube(@brace_size, @full_cross_len, @brace_size)
      .center_xy
      .rotate(z: t.alpha, x: -2)
      .translate(x: w/2.0, z: 2.5)


    res += cube(@brace_size, @full_cross_len, @brace_size)
      .center_xy
      .rotate(z: -t.alpha)
      .translate(x: -w/2.0)

    res += cube(@brace_size, @full_cross_len, @brace_size)
      .center_xy
      .rotate(z: -t.alpha, x: -2)
      .translate(x: -w/2.0, z: 2.5)

    res += cube(@brace_size, @brace_size*2, @brace_size)
    .center_xy
    .translate(x: -w, y: -w + @brace_size/2.0, z: @brace_size)

    res += cube(@brace_size, @brace_size*2, @brace_size)
    .center_xy
    .translate(x: w, y: -w + @brace_size/2.0, z: @brace_size)

    #tabs
    h = @brace_size + @lid_height
    tab_w = @brace_size*0.5
    tab_h = 2;

    brace_args = {brace_width: @brace_size, brace_depth: @brace_size,
      total_height: @lid_height, segments: @segments}
    spacing = 0.22
    res += Brace.new(brace_args)
      .rotate(z: 180)
      .translate(x: w, y: l*spacing)

    res += Brace.new(brace_args)
      .rotate(z: 180)
      .translate(x: w, y: -l*spacing)

    res += Brace.new(brace_args)
      .translate(x: -w, y: l*spacing)

    res += Brace.new(brace_args)
      .translate(x: -w, y: -l*spacing)

    res += Brace.new(brace_args)
      .rotate(z: -90)
      .translate(y: w, x: l*spacing)

    res += Brace.new(brace_args)
      .rotate(z: -90)
      .translate(y: w, x: -l*spacing)

    brace_args = {brace_width: @brace_size, brace_depth: @brace_size+2,
      total_height: @lid_height, segments: 1, top_span_ratio: 2.05}

    res -= Brace.new(brace_args)
      .rotate(z: 180)
      .translate(x: w, y: l*spacing, z: -h-@brace_size*0.5)

    res -= Brace.new(brace_args)
      .rotate(z: 180)
      .translate(x: w, y: -l*spacing, z: -h-@brace_size*0.5)

    res -= Brace.new(brace_args)
      .translate(x: -w, y: l*spacing, z: -h-@brace_size*0.5)

    res -= Brace.new(brace_args)
      .translate(x: -w, y: -l*spacing, z: -h-@brace_size*0.5)

    res -= Brace.new(brace_args)
      .rotate(z: -90)
      .translate(y: w, x: l*spacing, z: -h-@brace_size*0.5)

    res -= Brace.new(brace_args)
      .rotate(z: -90)
      .translate(y: w, x: -l*spacing, z: -h-@brace_size*0.5)

    res
  end
end
