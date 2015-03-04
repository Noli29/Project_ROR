class A
  def initialize
    @hash={'yes' => 23, 'b' => 'travel', 'yesterday' => 34, 5 => '234', :yesss => :fg, try: {'yesterday1' => 34, 'yesteryear' => 2014}, key: [{'yes' => 23, 'b' => 'travel'}], 'yesterday1' => 34, 'yesteryear' => 2014}
  end

  def k_v(hash)

  hash.inject({}){|result, (k, val)|

    new_k = case key

                when String then k.to_sym

                else k

              end

    new_val = case val

                  when Hash then k_v val

                  else val

                end

    result[new_k] = new_val

    result

  }

  end

end
