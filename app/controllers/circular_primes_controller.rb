class CircularPrimesController < ApplicationController

  def index
    @limit = params[:circular_primes_calculator][:limit].to_i if params[:circular_primes_calculator]
    if @limit
      circular_primes = CircularPrime.new(limit: @limit)
      @circular_primes = circular_primes.circular_primes
      @primes = circular_primes.calculated
    end
  
  end

end