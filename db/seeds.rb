# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

User.create(name: 'bookzrails', password:'bookzrails2014', password_confirmation:'bookzrails2014')
User.create(name: 'john', password:'john2014', password_confirmation:'john2014')


Product.delete_all
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
  image_url:   'wd4d.jpg',    
  price: 42.95)
# . . .
Product.create(title: 'Programming Ruby 1.9',
  description:
    %{<p>
        Ruby is the fastest growing and most exciting dynamic language
        out there. If you need to get working programs delivered fast,
        you should add Ruby to your toolbox.
      </p>},
  image_url: 'ruby.jpg',
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
  image_url: 'rtp.jpg',
  price: 43.75)

Product.create(title: 'Programming Android',
  description:
    %{<p>
Another good advanced Android programming book. I do not think that there is a single advanced programming book that is perfect in all departments. If you are a professional developer, or a technical course developer, or lecturer I would recommend looking through all of the above books. Different authors or even teams of authors have their own strengths and weaknesses. Programming Android has a particularly good section on Content Providers and Web service oriented application development. The sections on mapping, location, sensors and multi-media are not particularly strong. These are specialised topics and I am not aware of any books that cover them particularly well. Treat the samples and examples on these topics as starting points. Read the Android documentation and build the relevant examples to be found on the Android web site. Then be prepared to do a lot of "first principles" thinking, a lot of experimentation and even be prepared to "dig into the source code".
      </p>},
  image_url: 'Programming Android.jpg',
  price: 88.50)
# . . .

Product.create(title: 'Codes At Work',
  description:
    %{<p>
The book is Coders at Work: Reflections on the Craft of Programming, by Peter Siebel [amazon.com, amazon.co.uk].  It’s a series of lengthy, rambing interviews, averaging forty pages each, with fifteen programmers.  These include some seriously big hitters: among others, Jamie Zawinsky, Peter Norvig, Guy L. Steele, my own hero Ken Thompson, and finally — saved for the last chapter — Don Knuth.
      </p>},
  image_url: 'Codes At Work.jpg',
  price: 95.50)
# . . .

Product.create(title: 'Begining Linux Programming',
  description:
    %{<p>
        A good starting book for those who already know C and who want to get started with Unix programming. The book covers a wide range of topics and provides many practical illustrative examples. Starting with the mechanics of writing Unix programs in C it goes on to cover basic system calls, file I/O, and interprocess communication. It also provides an introduction to shell programming. In addition it introduces various toolkits and libraries for working with user interfaces, both simple terminal mode applications and GUI (Graphical User Interface) applications based on X and GTK+. Networking and interprocess communications topics such as pipes, semaphores, and socket programming are also covered. 
      </p>},
  image_url: 'Begining Linux Programming.jpg',
  price: 105.50)
# . . .

Product.create(title: 'HTML 5 Programming',
  description:
    %{<p>
        echnically this is quite an advanced book. It is very much written for experienced developers. It is one of the few books that has a chapter on NDK programming. Because of rapid developments in the Android SDK and NDK a 3rd edition is (according to Amazon) due to be released in the near future. There is no obvious mention of the upcoming 3rd edition on the Manning web site. The section on network programming is very useful. Android internet applications are very much oriented towards the REST protocol, and the example in this book serves as a useful starting point to working with REST, and implementing Android based REST client applications. Till the third edition appears I would recommend purchasing this edition. Manning have an early access programming called MEAP (Manning Early Access Program) that is similar to the O'Reilly "Rough Cuts" program. The third edition is not in the MEAP program. However, another advanced Android programming book, Android In Practice, is. I especially liked the sections on multi-threading and HTTP networking and web services. 
      </p>},
  image_url: 'HTML 5 Programming.jpg',
  price: 200.50)
# . . .

Product.create(title: 'Begining Linux Programming',
  description:
    %{<p>
         don't for one minute believe that you can teach yourself Android programming in 24 hours, and some of the chapters require considerably more than an hour of work to do them justice. Nevertheless, another fairly solid piece of work from SAMS.
      </p>},
  image_url: 'Begining Linux Programming.jpg',
  price: 90.50)
# . . .

Product.create(title: 'Learning Python',
  description:
    %{<p>A good starting book for those who already know C and who want to get started with Unix programming. The book covers a wide range of topics and provides many practical illustrative examples. Starting with the mechanics of writing Unix programs in C it goes on to cover basic system calls, file I/O, and interprocess communication. It also provides an introduction to shell programming. In addition it introduces various toolkits and libraries for working with user interfaces, both simple terminal mode applications and GUI (Graphical User Interface) applications based on X and GTK+. Networking and interprocess communications topics such as pipes, semaphores, and socket programming are also covered.</p>},
  image_url: 'Learning Python.jpg',
  price: 80.50)
# . . .

Product.create(title: 'Learn Objective-C on the Mac',
  description:
    %{<p>Technically this is quite an advanced book. It is very much written for experienced developers. It is one of the few books that has a chapter on NDK programming. Because of rapid developments in the Android SDK and NDK a 3rd edition is (according to Amazon) due to be released in the near future. There is no obvious mention of the upcoming 3rd edition on the Manning web site. The section on network programming is very useful. Android internet applications are very much oriented towards the REST protocol, and the example in this book serves as a useful starting point to working with REST, and implementing Android based REST client applications. Till the third edition appears I would recommend purchasing this edition. Manning have an early access programming called MEAP (Manning Early Access Program) that is similar to the O'Reilly "Rough Cuts" program. The third edition is not in the MEAP program. However, another advanced Android programming book, Android In Practice, is. I especially liked the sections on multi-threading and HTTP networking and web services.</p>},
  image_url: 'Learn Objective-C on the Mac.jpg',
  price: 205.50)
# . . .

Product.create(title: 'Programming Perl',
  description:
    %{<p>Technically this is quite an advanced book. It is very much written for experienced developers. It is one of the few books that has a chapter on NDK programming. Because of rapid developments in the Android SDK and NDK a 3rd edition is (according to Amazon) due to be released in the near future. There is no obvious mention of the upcoming 3rd edition on the Manning web site. The section on network programming is very useful. Android internet applications are very much oriented towards the REST protocol, and the example in this book serves as a useful starting point to working with REST, and implementing Android based REST client applications. Till the third edition appears I would recommend purchasing this edition. Manning have an early access programming called MEAP (Manning Early Access Program) that is similar to the O'Reilly "Rough Cuts" program. The third edition is not in the MEAP program. However, another advanced Android programming book, Android In Practice, is. I especially liked the sections on multi-threading and HTTP networking and web services.</p>},
  image_url: 'Programming Perl.png',
  price: 205.50)
# . . .