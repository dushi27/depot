require 'unirest'
Product.delete_all
authors = ['Isaac%20Asimov', 'tolkien', 'arthur%20conan%20doyle','Andrew%20Murray', 'shakespeare', 'j%20k%20rowling', 'charles%20dickens', 'leo%20tolstoy']
authors.each do |author|
  search = Unirest.get("https://openlibrary.org/search.json?q=#{author}&format=json")
  search.body['docs'].each do |book|
    begin
      isbn =  book['isbn'].first
      title = book['title']
      image = "http://covers.openlibrary.org/b/isbn/#{isbn}-L.jpg"
    rescue => e
      puts e
      next
    end
     
    product = Product.new(:title => title, :price => Faker::Commerce.price, :description => Faker::Lorem.words(4).join, :remote_image_url => image)
    product.save
    
    if product.id and product.id % 3 == 0
      cart = Cart.create  
      line_item = LineItem.create(:product_id => product.id, :cart_id => cart.id, :quantity => 1)
      order = Order.create(:name => Faker::Name.name, :street_address => Faker::Address.street_address, :city => Faker::Address.city,
        :pay_type => "Check", :zip => Faker::Address.zip, :email => Faker::Internet.email)
      line_item.order_id = order.id
      line_item.save
    end
    sleep(1)
  end
end
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

User.create(name: 'bookzrails', password:'bookzrails2014', password_confirmation:'bookzrails2014')
User.create(name: 'john', password:'john2014', password_confirmation:'john2014')



=begin
1000.times do |n|
  product = Product.new(:title => Faker::Lorem.words(2).join(" "), :price => Faker::Commerce.price, :description => Faker::Lorem.paragraphs(1).first, :remote_image_url => "http://robohash.org/sitsequiquia.png?size=300x300")
  product.save
=end


=begin
Product.create(title: 'Web Design for Developers',
  description:
    %{<p>
        <em>Web Design for Developers</em> will show you how to make your
        web-based application look professionally designed. We'll help you
        learn how to pick the right colors and fonts, avoid costly interface
        and accessibility mistakes -- your application will really come alive.
        We'll also walk you through some common Photoshop and CSS techniques
        and work through a web site redesign, taking a new design from concept
        all the way to implementation.
      </p>},   
  price: 42.95)
# . . .
Product.create(title: 'Programming Ruby 1.9',
  description:
    %{<p>
        Ruby is the fastest growing and most exciting dynamic language
        out there. If you need to get working programs delivered fast,
        you should add Ruby to your toolbox.
      </p>},
  price: 49.50)
# . . .

Product.create(title: 'Rails Test Prescriptions',
  description: 
    %{<p>
        <em>Rails Test Prescriptions</em> is a comprehensive guide to testing
        Rails applications, covering Test-Driven Development from both a
        theoretical perspective (why to test) and from a practical perspective
        (how to test effectively). It covers the core Rails testing tools and
        procedures for Rails 2 and Rails 3, and introduces popular add-ons,
        including Cucumber, Shoulda, Machinist, Mocha, and Rcov.
      </p>},
  price: 43.75)

Product.create(title: 'Programming Android',
  description:
    %{<p>
Another good advanced Android programming book. I do not think that there is a single advanced programming book that is perfect in all departments. If you are a professional developer, or a technical course developer, or lecturer I would recommend looking through all of the above books. Different authors or even teams of authors have their own strengths and weaknesses. Programming Android has a particularly good section on Content Providers and Web service oriented application development. The sections on mapping, location, sensors and multi-media are not particularly strong. These are specialised topics and I am not aware of any books that cover them particularly well. Treat the samples and examples on these topics as starting points. Read the Android documentation and build the relevant examples to be found on the Android web site. Then be prepared to do a lot of "first principles" thinking, a lot of experimentation and even be prepared to "dig into the source code".
      </p>},
  price: 88.50)
# . . .

Product.create(title: 'Codes At Work',
  description:
    %{<p>
The book is Coders at Work: Reflections on the Craft of Programming, by Peter Siebel [amazon.com, amazon.co.uk].  It’s a series of lengthy, rambing interviews, averaging forty pages each, with fifteen programmers.  These include some seriously big hitters: among others, Jamie Zawinsky, Peter Norvig, Guy L. Steele, my own hero Ken Thompson, and finally — saved for the last chapter — Don Knuth.
      </p>},
  price: 95.50)
# . . .

Product.create(title: 'Begining Linux Programming',
  description:
    %{<p>
        A good starting book for those who already know C and who want to get started with Unix programming. The book covers a wide range of topics and provides many practical illustrative examples. Starting with the mechanics of writing Unix programs in C it goes on to cover basic system calls, file I/O, and interprocess communication. It also provides an introduction to shell programming. In addition it introduces various toolkits and libraries for working with user interfaces, both simple terminal mode applications and GUI (Graphical User Interface) applications based on X and GTK+. Networking and interprocess communications topics such as pipes, semaphores, and socket programming are also covered. 
      </p>},
  price: 105.50)
# . . .

Product.create(title: 'HTML 5 Programming',
  description:
    %{<p>
        echnically this is quite an advanced book. It is very much written for experienced developers. It is one of the few books that has a chapter on NDK programming. Because of rapid developments in the Android SDK and NDK a 3rd edition is (according to Amazon) due to be released in the near future. There is no obvious mention of the upcoming 3rd edition on the Manning web site. The section on network programming is very useful. Android internet applications are very much oriented towards the REST protocol, and the example in this book serves as a useful starting point to working with REST, and implementing Android based REST client applications. Till the third edition appears I would recommend purchasing this edition. Manning have an early access programming called MEAP (Manning Early Access Program) that is similar to the O'Reilly "Rough Cuts" program. The third edition is not in the MEAP program. However, another advanced Android programming book, Android In Practice, is. I especially liked the sections on multi-threading and HTTP networking and web services. 
      </p>},
  price: 200.50)
# . . .

Product.create(title: 'Begining Linux Programming',
  description:
    %{<p>
         don't for one minute believe that you can teach yourself Android programming in 24 hours, and some of the chapters require considerably more than an hour of work to do them justice. Nevertheless, another fairly solid piece of work from SAMS.
      </p>},
  price: 90.50)
# . . .

Product.create(title: 'Learning Python',
  description:
    %{<p>A good starting book for those who already know C and who want to get started with Unix programming. The book covers a wide range of topics and provides many practical illustrative examples. Starting with the mechanics of writing Unix programs in C it goes on to cover basic system calls, file I/O, and interprocess communication. It also provides an introduction to shell programming. In addition it introduces various toolkits and libraries for working with user interfaces, both simple terminal mode applications and GUI (Graphical User Interface) applications based on X and GTK+. Networking and interprocess communications topics such as pipes, semaphores, and socket programming are also covered.</p>},
  price: 80.50)
# . . .

Product.create(title: 'Learn Objective-C on the Mac',
  description:
    %{<p>Technically this is quite an advanced book. It is very much written for experienced developers. It is one of the few books that has a chapter on NDK programming. Because of rapid developments in the Android SDK and NDK a 3rd edition is (according to Amazon) due to be released in the near future. There is no obvious mention of the upcoming 3rd edition on the Manning web site. The section on network programming is very useful. Android internet applications are very much oriented towards the REST protocol, and the example in this book serves as a useful starting point to working with REST, and implementing Android based REST client applications. Till the third edition appears I would recommend purchasing this edition. Manning have an early access programming called MEAP (Manning Early Access Program) that is similar to the O'Reilly "Rough Cuts" program. The third edition is not in the MEAP program. However, another advanced Android programming book, Android In Practice, is. I especially liked the sections on multi-threading and HTTP networking and web services.</p>},
  price: 205.50)
# . . .

Product.create(title: 'Programming Perl',
  description:
    %{<p>Technically this is quite an advanced book. It is very much written for experienced developers. It is one of the few books that has a chapter on NDK programming. Because of rapid developments in the Android SDK and NDK a 3rd edition is (according to Amazon) due to be released in the near future. There is no obvious mention of the upcoming 3rd edition on the Manning web site. The section on network programming is very useful. Android internet applications are very much oriented towards the REST protocol, and the example in this book serves as a useful starting point to working with REST, and implementing Android based REST client applications. Till the third edition appears I would recommend purchasing this edition. Manning have an early access programming called MEAP (Manning Early Access Program) that is similar to the O'Reilly "Rough Cuts" program. The third edition is not in the MEAP program. However, another advanced Android programming book, Android In Practice, is. I especially liked the sections on multi-threading and HTTP networking and web services.</p>},
  price: 205.50)
# . . .
=end