## Tech Stack

**Code:** Nodejs, nodemon, mysql, fetchAPI, dotenv, js.

## Installation | How to run server

> **<kbd>1.</kbd>** Install [node.js v16.14+](https://nodejs.org/en) or higher
>
> **<kbd>2.</kbd>** Open terminal **`cd server`**
>
> **<kbd>3.</kbd>** Install all of the packages with **`npm install`**
>
> **<kbd>4.</kbd>** Need to add the following environment variables to your `.env` file.
>
> **<kbd>5.</kbd>** Use [xampp](https://www.apachefriends.org/download.html) for database (`mysql`). You should create a database named `my-shop` (according to the `.env` file) and create an `account` table with fields as shown below..
>
> ![image](https://github.com/hcdman/My-Shop/assets/92797788/a36a2d00-0d3d-4c47-9139-75f7978a00e9)
>
> **<kbd>6.</kbd>** Start server with **`npm start`**

#### **NOTE:**

> _If you are having errors/problems with starting delete the `package.json` file and do, before you install the packages `npm init`_

### API

You can use `.http` file (extension `REST Client`) instead of `Postman` to test the API

| Method   | URL                    | Description                              |
| -------- | ---------------------- | ---------------------------------------- |
| `POST`   | `/api/register`        | Create new account admin                 |
| `POST`   | `/api/login`           | Login my-shop                            |
| `GET`    | `/type/getall`         | Get all type of product                  |
| `POST`   | `/type/add`            | Add new type                             |
| `DELETE` | `/type/delete/:id`     | Delete type has ID                       |
| `PUT`    | `/type/update/:id`     | Update name type                         |
| `GET`    | `/product/getall`      | Get all product                          |
| `POST`   | `/product/add`         | Add new product                          |
| `GET`    | `/product/get/:id`     | Get one product has ID                   |
| `DELETE` | `/product/delete/:id`  | Delete product has ID                    |
| `PUT`    | `/product/update/:id`  | Update product has ID                    |
| `GET`    | `/customer/getall`     | Get all customer                         |
| `POST`   | `/customer/add`        | Add new customer                         |
| `GET`    | `/customer/get/:id`    | Get one customer has ID                  |
| `DELETE` | `/customer/delete/:id` | Delete customer has ID                   |
| `PUT`    | `/customer/update/:id` | Update customer has ID                   |
| `GET`    | `/bill/getall`         | Get all bill                             |
| `POST`   | `/bill/add`            | Add new bill                             |
| `GET`    | `/bill/get/:id`        | Get one bill has ID                      |
| `DELETE` | `/bill/delete/:id`     | Delete bill has ID                       |
| `PUT`    | `/bill/update/:id`     | Update bill has ID                       |
| `POST`   | `/cthd/add`            | Thêm mới một chi tiết hóa đơn            |
| `GET`    | `/cthd/get/:id`        | Lấy thông tin chi tiết của hóa đơn có ID |
