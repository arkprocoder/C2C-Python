from flask import Flask,redirect,render_template,request,url_for
from flask_sqlalchemy import SQLAlchemy
from flask.globals import request,session
from flask_login import login_user,login_manager,UserMixin,LoginManager,login_required,logout_user
from flask_login import current_user
from werkzeug.security import generate_password_hash,check_password_hash
from flask import flash



local_server=True
app = Flask(__name__)
app.secret_key="%^%@&@*&()@ANEES!#@#@"


login_manager=LoginManager(app)
login_manager.login_view='login'


# db connections
# app.config['SQLALCHEMY_DATABASE_URI']='mysql://username:password@localhost/databasename'
app.config['SQLALCHEMY_DATABASE_URI']='mysql+pymysql://root:@localhost/c2c?ssl_disabled=True'
db=SQLAlchemy(app)




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

    def get_id(self):
        return self.user_id



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
    return render_template('index.html')

@app.route("/contact") #http://127.0.0.1:5000/contact
def contact():
    return render_template('contact.html')

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

app.run(debug=True)