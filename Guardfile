guard :shell do
  watch(/anchor_holder.rb/) { system('ruby anchor_holder.rb') }
  watch(%r{^lib/.+/.+\.rb}) { system('ruby anchor_holder.rb') }
end
