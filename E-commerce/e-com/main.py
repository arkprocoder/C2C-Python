from flask import Flask,redirect,render_template,request,url_for
from flask_sqlalchemy import SQLAlchemy
from flask.globals import request,session
from flask_login import login_user,login_manager,UserMixin,LoginManager,login_required,logout_user
from flask_login import current_user
from werkzeug.security import generate_password_hash,check_password_hash
from flask import flash
from werkzeug.utils import secure_filename
import os

local_server=True
app = Flask(__name__)
app.secret_key="%^%@&@*&()@ANEES!#@#@"


login_manager=LoginManager(app)
login_manager.login_view='login'


# db connections
# app.config['SQLALCHEMY_DATABASE_URI']='mysql://username:password@localhost/databasename'
app.config['SQLALCHEMY_DATABASE_URI']='mysql+pymysql://root:@localhost/c2c?ssl_disabled=True'
db=SQLAlchemy(app)


# configuration for handling files
app.config['UPLOAD_FOLDER']='static/uploads/'
app.config['ALLOWED_EXTENSIONS']={'png','jpg','jpeg','gif'}
app.config['MAX_CONTENT_LENGTH']=16*1024*1024 #16mb max upload size




@login_manager.user_loader
def load_user(user_id):
    return Signup.query.get(user_id)

class Test(db.Model):
    id=db.Column(db.Integer,primary_key=True)
    name=db.Column(db.String(50))



class Signup(UserMixin,db.Model):
    user_id=db.Column(db.Integer,primary_key=True)
    first_name=db.Column(db.String(50))
    last_name=db.Column(db.String(50))
    email=db.Column(db.String(50),unique=True)
    mobile_number=db.Column(db.String(12),unique=True)
    password=db.Column(db.String(2000))
    profileimage=db.Column(db.String(500))
    isAdmin=db.Column(db.String(10))

    def get_id(self):
        return self.user_id


class Contact(db.Model):
    contact_id=db.Column(db.Integer,primary_key=True)
    email=db.Column(db.String(50))
    description=db.Column(db.String(500))




class Product(db.Model):
    id=db.Column(db.Integer,primary_key=True)
    name=db.Column(db.String(100),nullable=False)
    price=db.Column(db.String(10),nullable=False)
    category=db.Column(db.String(100),nullable=False)
    description=db.Column(db.String(500))
    stock=db.Column(db.Integer,default=0,nullable=False)
    image=db.Column(db.String(100),nullable=True)
    email=db.Column(db.String(100),nullable=False)


def allowed_file(filename):
    return '.' in filename and filename.rsplit('.',1)[1].lower() in app.config['ALLOWED_EXTENSIONS']


@app.route("/test")
def test():
    try:
        data=Test.query.all()
        print(data)
        return "Database is Connected"

    except Exception as e:
        return f"Database is not connected {e}"

@app.route("/")   #http://127.0.0.1:5000/ ,("")
def home():
    if not current_user.is_authenticated:
        return redirect(url_for('login'))
    
    products=Product.query.all()
    return render_template('index.html',products=products)

@app.route("/contact",methods=['GET','POST']) #http://127.0.0.1:5000/contact
def contact():
    if request.method=="POST":
        email=request.form.get("email")
        desc=request.form.get("desc")
        query=Contact(email=email,description=desc)
        db.session.add(query)
        db.session.commit()
        flash("We will get back to you soon..","success")
        return render_template("contact.html")
    return render_template("contact.html")

#http://127.0.0.1:5000/signup
@app.route("/signup",methods=['GET','POST'])
def signup():
    if request.method=="POST":
        firstName=request.form.get('fname')
        lastName=request.form.get('lname')
        email=request.form.get('email')
        mobile=request.form.get('mobile')
        password=request.form.get('pass1')
        confirmpassword=request.form.get('pass2')
        print(firstName,lastName,email,mobile,password,confirmpassword)

        if password!=confirmpassword:
            flash("Password is not getting matched","warning")
            return redirect(url_for("signup"))
        
        fetchemail=Signup.query.filter_by(email=email).first()
        fetchphone=Signup.query.filter_by(mobile_number=mobile).first()
        if fetchemail or fetchphone:
            flash("User Exist already","danger")
            return redirect(url_for("signup"))

        if len(mobile)!=10:
            flash("Please Enter 10 digit number","warning")
            return redirect(url_for("signup"))


        gen_pass=generate_password_hash(password)

        # below is ORM method 
        # query=Signup(first_name=firstName,last_name=lastName,email=email,mobile_number=mobile,password=gen_pass)
        # db.session.add(query)
        # db.session.commit()

        # below is sql method
        query=f"INSERT into `signup` (`first_name`,`last_name`,`email`,`mobile_number`,`password`) VALUES ('{firstName}','{lastName}','{email}','{mobile}','{gen_pass}')"
        with db.engine.begin() as conn:
            conn.exec_driver_sql(query)
            flash("Signup is Success! Please Login","success")
            return redirect(url_for("login"))
      

    return render_template('signup.html')


@app.route("/login", methods=['GET','POST'])
def login():
    if request.method=="POST":
        email=request.form.get('email')
        password=request.form.get('pass1')
        user=Signup.query.filter_by(email=email).first()
        if user and check_password_hash(user.password,password):
            login_user(user) 
            flash("Login Success! Welcome","success")
            return render_template("index.html")
        else:
            flash("Invalid Credentials","danger")
            return render_template("login.html")
    return render_template('login.html')


@app.route('/logout')
@login_required
def logout():
    logout_user()
    flash("Logout Success!","success")
    return  render_template('login.html')


@app.route("/profile", methods=['GET','POST'])
@login_required
def profile():
    userdata=Signup.query.filter_by(email=current_user.email).first()
    print(userdata)
    return render_template('profile.html',userdata=userdata)


@app.route("/uploadprofile",methods=['POST'])
@login_required
def uploadprofile():
    if request.method=="POST":
        file=request.files['profilepic']
        if file and allowed_file(file.filename):
            # save the file in the uploads folder
            filename=secure_filename(file.filename)
            file.save(os.path.join(app.config['UPLOAD_FOLDER'],filename))

            query=f"UPDATE `signup` SET `profileimage`='{filename}' WHERE `signup`.`email`='{current_user.email}'"

            with db.engine.begin() as conn:
                conn.exec_driver_sql(query)
                flash("Profile Uploaded Successfully","info")
                return redirect(url_for("profile"))
    else:
        return render_template("profile.html")



@app.route("/admin")
def admin():
    print("checking if admin", current_user.isAdmin)
    if not current_user.is_authenticated and not current_user.isAdmin:
        return redirect(url_for('login'))
    products=Product.query.all()
    return render_template('admin.html',products=products)

@app.route("/addproduct",methods=['POST'])
@login_required
def addproduct():
    if not current_user.is_authenticated and not current_user.isAdmin:
        return redirect(url_for('login'))
    if request.method=="POST":
        email=request.form.get('email')
        name=request.form.get('pname')
        stock=request.form.get('stock')
        desc=request.form.get('desc')
        price=request.form.get('price')
        category=request.form.get('category')
        file=request.files['productpic']

        if file and allowed_file(file.filename):
            # save the file in the uploads folder
            filename=secure_filename(file.filename)
            file.save(os.path.join(app.config['UPLOAD_FOLDER'],filename))

            product=Product(name=name,price=price,category=category,description=desc,stock=stock,image=filename,email=current_user.email)
            db.session.add(product)
            db.session.commit()
            flash("Product Added Successfully","success")
            return redirect(url_for('admin'))

           
    else:
        return render_template("profile.html")

@app.route("/delete_product/<int:product_id>", methods=['POST', 'GET'])
@login_required
def delete_product(product_id):
    # Find the product by its ID
    product = Product.query.get_or_404(product_id)
    
    # Delete the product from the database
    db.session.delete(product)
    db.session.commit()
    
    # Show a success message and redirect back to the admin panel
    flash("Product deleted successfully!", "success")
    return redirect(url_for('admin'))


app.run(debug=True)