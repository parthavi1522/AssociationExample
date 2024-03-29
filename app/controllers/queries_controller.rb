class QueriesController < ApplicationController
  def index
    @user = User.find(1)
    @users = User.find([1, 3])
    
    # @user = User.take
    # @users = User.take(3)
    
    # @user = User.first
    # @users = User.first(3)
    # @user_order = User.order(:name).first

    # @user = User.last
    # @users = User.last(3)
    # @user_order = User.order(:name).last

    # @user = User.find_by(name: "Alice") 
    # # OR
    # @user = User.where(name: "Alice").take

    # @all_users = User.all

    # @users = User.limit(5)

    # @users = User.limit(5).offset(5)
    
    # @posts  = Post.where(user_id: [1..5]).limit(15).order('id desc').unscope(:order)
    
    # @posts  = Post.where(user_id: [1..5], id: [1..10]).unscope(where: :user_id)

    # @posts  = Post.where(user_id: [1..5]).limit(15).order('id desc').only(:order, :where)

    # @posts = Post.select(:title, :content).reselect(:title, :user_id, :content)

    # @vehicles = Sti::Vehicle.reorder('year ASC')
    
    # @vehicles = Sti::Vehicle.order(:year).reverse_order
    
    # @vehicles = Sti::Vehicle.where("type = ?", "Sti::Car").where.not(type: "Sti::Truck")

    # @users = User.group(:posts).regroup(:id)

    # @user = User.readonly.first

    # @users = User.where.associated(:posts)
    
    # @users = User.where.missing(:posts)
    
    # @users = User.preload(:posts).limit(5)

    # @user = User.strict_loading.first
    
    # @user = User.first
    # @user.strict_loading!

    # @vehicles = Sti::Vehicle.old(2020)

    # @vehicles = Sti::Vehicle.unscoped.load

    # @user = User.find_or_create_by(name: 'Andy')

    # @user = User.find_or_initialize_by(name: 'Nina')

    # @users = User.find_by_sql("SELECT * FROM users INNER JOIN posts ON users.id = posts.user_id ORDER BY users.created_at desc")

    # @user_id = User.where(id: 1).pick(:id)

    
    
    # RETURN ONLY TRUE FALSE
    User.exists?(1)
    User.exists?(id: [1,2,3])
    User.where(name: 'Ryan').exists?
    User.exists?


    # RETURN COUNT OF TABLE RECORD
    User.count
    User.where(name: 'Ryan').count

    # EXPLAIN THE STRUCUTURE OF TABLE
    User.where(id: 1).joins(:posts).explain

    begin
      u1 = User.find(1)
      u2 = User.find(1)

      u1.name = "Sandra"
      u1.save

      u2.name = "Michael"
      u2.save
    rescue ActiveRecord::StaleObjectError
      flash.now[:alert] = 'Another user has updated this record. Please review and try again.'
    end

    user = User.last
    user.with_lock do
      user.name = "Test"
      user.save
    end
  end
end
