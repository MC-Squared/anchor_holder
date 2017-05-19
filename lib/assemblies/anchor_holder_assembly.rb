class AnchorHolderAssembly < SolidRuby::Assembly

  # Assemblies are used to show how different parts interact on your design.

  # Skip generation of the 'output' method for this assembly.
  # (will still generate 'show')
  skip :output

  def part(show)
    # Create a test cube
    #res = TopHolder.new
    #res = Holder.new(height: 13, segments: 1)

    #res += Holder.new(height: 13, segments: 1)
    #  .translate(z: 13+5+0.5)

    #res = Brace.new(total_height: 13, brace_width: 5, brace_depth: 5)
    #return res
    #
    #res += TopHolder.new.translate(z: 5+13+0.5)
    res = Holder.new(height: 60+13+8)
    #
    #res += Holder.new(height: 13, segments: 1).translate(z: (23*2)+60+5+2.5)
    #
    # res += TopHolder.new.translate(z: 95)
    #res = Brace.new(brace_width: 5, brace_depth: 10, total_height: 13, segments: 1)
    #  .translate(x:3)
    #
    # res += cube(1,1,5)
    #   .translate(x: 0, z: 0)
    #   .color("BLUE")

    # res += cylinder(d: 100, h: 13)
    #   .rotate(x: -2)
    #   .translate(y: 0, z: 60+8+2)
    #   .color("RED")
    #
    # res += cylinder(d1: 100, d2: 85, h: 60)
    #   .rotate(x: -2)
    #   .translate(y: 0, z: 8) #((5+13+5)*2)+5)
    #   .color("BLUE")

    # res += cube(1,1,55)
    #   .translate(x: 65, z: 35)
    #   .color("RED")

    # always make sure the lowest statement always returns the object that you're working on
    res
  end
end
