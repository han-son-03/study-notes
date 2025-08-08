from flask import Flask, jsonify
import sqlite3

app = Flask(__name__)

@app.route("/api/products")
def get_products():
    conn = sqlite3.connect("products.db")
    cursor = conn.cursor()
    cursor.execute("SELECT category, brand, product_name, price FROM products")
    rows = cursor.fetchall()
    conn.close()

    result = [
        {"category": row[0], "brand": row[1], "name": row[2], "price": row[3]}
        for row in rows
    ]
    return jsonify(result)

if __name__ == "__main__":
    app.run(debug=True)
