from flask import Flask,render_template
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)


# db connections
# app.config['SQLALCHEMY_DATABASE_URI']='mysql://username:password@localhost/databasename'
app.config['SQLALCHEMY_DATABASE_URI']='mysql://root:@localhost/c2c'
db=SQLAlchemy(app)


class Test(db.Model):
    id=db.Column(db.Integer,primary_key=True)
    name=db.Column(db.String(50))


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
    return render_template('index.html')

@app.route("/contact") #http://127.0.0.1:5000/contact
def contact():
    return render_template('contact.html')

#http://127.0.0.1:5000/signup
@app.route("/signup")
def signup():
    return render_template('signup.html')


@app.route("/login")
def login():
    return render_template('login.html')


app.run(debug=True)