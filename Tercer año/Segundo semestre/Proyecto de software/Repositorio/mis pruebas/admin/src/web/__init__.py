from flask import Flask, render_template
from src.web.handlers.error import not_found

def create_app(env="development", static_folder="../../static"):
    app = Flask(__name__, static_folder=static_folder)
    
    @app.route('/')
    def home():
        return render_template('home.html')
    
    @app.route('/about')
    def about():
        return render_template('about.html')
    
    app.register_error_handler(404, not_found)
    
    return app

