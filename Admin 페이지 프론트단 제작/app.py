from flask import Flask, jsonify, request
import sqlite3
from flask_cors import CORS # CORS 문제를 해결하기 위해 필요

app = Flask(__name__)
CORS(app) # 모든 경로에 대해 CORS 허용

DATABASE = 'products.db'

def get_db_connection():
    conn = sqlite3.connect(DATABASE)
    conn.row_factory = sqlite3.Row # 컬럼 이름을 통해 데이터 접근 가능하도록 설정
    return conn

# 모든 상품 데이터를 반환하는 API 엔드포인트
@app.route('/api/products', methods=['GET'])
def get_products():
    conn = get_db_connection()
    cursor = conn.cursor()

    category = request.args.get('category') # 쿼리 파라미터로 카테고리 필터링
    product_name_keyword = request.args.get('name') # 쿼리 파라미터로 상품명 검색

    query = "SELECT category, brand, product_name, price FROM products WHERE 1=1"
    params = []

    if category:
        query += " AND category = ?"
        params.append(category)

    if product_name_keyword:
        query += " AND product_name LIKE ?"
        params.append(f"%{product_name_keyword}%")

    cursor.execute(query, params)
    products = cursor.fetchall()
    conn.close()

    # 결과를 JSON 형식으로 변환
    products_list = []
    for product in products:
        products_list.append({
            'category': product['category'],
            'brand': product['brand'],
            'product_name': product['product_name'],
            'price': product['price']
        })
    return jsonify(products_list)

if __name__ == '__main__':
    # product.py를 통해 products.db가 생성되어 있어야 합니다.
    # 만약 products.db가 없다면, product.py를 먼저 실행하여 데이터를 채워야 합니다.
    app.run(debug=True, port=5000) # 개발 모드, 5000번 포트 사용