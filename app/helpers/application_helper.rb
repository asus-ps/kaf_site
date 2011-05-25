# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
    def years_mass(count)
    i = Time.now.year;
    k = 0;
    years = Array.new;
    while k!=count
      years[k] = i - k;
      k = k + 1;
    end
    years
  end
end
