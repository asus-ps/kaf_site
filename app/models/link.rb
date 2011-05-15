class Link < ActiveRecord::Base
  validates_presence_of :url
  validates_length_of :url, :maximum => 255
  #validates_format_of :url, :with => /^([a-z0-9]([-a-z0-9]*[a-z0-9])?\.)+((a[cdefgilmnoqrstuwxz]|aero|arpa)|(b[abdefghijmnorstvwyz]|biz)|(c[acdfghiklmnorsuvxyz]|cat|com|coop)|d[ejkmoz]|(e[ceghrstu]|edu)|f[ijkmor]|(g[abdefghilmnpqrstuwy]|gov)|(h[kmnrtu]#{RAILS_ENV=='test'?'|host':''})|(i[delmnoqrst]|info|int)|(j[emop]|jobs)|k[eghimnprwyz]|l[abcikrstuvy]|(m[acdghklmnopqrstuvwxyz]|mil|mobi|museum)|(n[acefgilopruz]|name|net)|(om|org)|(p[aefghklmnrstwy]|pro)|qa|r[eouw]|s[abcdeghijklmnortvyz]|(t[cdfghjklmnoprtvwz]|travel)|u[agkmsyz]|v[aceginu]|w[fs]|y[etu]|z[amw])$/
  validates_uniqueness_of :url


  def self.search(search, page)
    if search
      paginate :per_page => 20, :page => page,
               :conditions => ['url LIKE :q OR description LIKE :q ',{:q => "%#{search}%"}]
    else
      paginate :per_page => 20, :page => page
    end
  end
end
