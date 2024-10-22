from flask import Flask,render_template

app = Flask(__name__)

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