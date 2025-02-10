# ✅ To-Do List Smart Contract

## 📝 Overview

The **To-Do List Smart Contract** allows users to **create, read, update, and manage tasks directly on the Ethereum blockchain**.

It ensures that task management is transparent and immutable, leveraging blockchain technology to securely store and track tasks.

---

## ✨ Features

✔️ Supports basic task management operations:

- 📝 **Create a task** (title, description, completion status)
- 👀 **Read a specific task** by index
- 📋 **View the full task list**
- ✅ **Mark a task as completed**
- 🚫 **Prevent overwriting already completed tasks**
- 🔍 **Validate task indices to avoid out-of-bounds errors**

✔️ Implements **modifiers** to:

- 🔍 **Validate task indices** to avoid out-of-bounds errors
- 🚫 **Prevent overwriting** already completed tasks

✔️ Emits **events** for key operations:

- 📌 **Task created**
- 📖 **Task updated**
- 📋 **Read the full task list**

---

## ⚙️ How to Use

### 🛠 Tools and Environment

✅ **Remix IDE** ([Remix Ethereum](https://remix.ethereum.org/))  
✅ **Solidity 0.8.24 compiler**

### 🚀 Deploying the Smart Contract

1. **Open Remix IDE** ([Remix Ethereum](https://remix.ethereum.org/))
2. **Create a new Solidity file**
   - Click on **File Explorers** > "Create New File"
   - Name it **TodoList.sol**
3. **Copy & Paste** the contract code into the file
4. **Select Solidity Compiler**
   - Navigate to the **"Solidity Compiler"** tab
   - Choose **0.8.24** as the compiler version
   - Click **Compile TodoList.sol**
5. **Deploy the Contract**
   - Go to the **"Deploy & Run Transactions"** tab
   - Select a **test network** (e.g., **Remix VM (Cancun)**)
   - Click **🚀 Deploy**

---

## ✅ Interacting & Testing

Once deployed, test the functions. Here are some examples:

#### 📝 **Create a Task**

- Call **createTask(title, description, isDone)**
- Check the emitted event **taskCreated(title, description, isDone)**
- Confirm that the task appears in the list

#### 👀 **Read a Specific Task**

- Call **readTask(index)**
- Check the emitted event **readATask(task)**
- Confirm that the task details are correctly displayed

#### 📋 **View All Tasks**

- Call **readList()**
- Open the **transaction logs in Remix** to see the full task list

#### ✅ **Mark a Task as Completed**

- Call **updateIsDoneTask(index)**
- Ensure that `isDone` is updated to `true`
- Check the emitted event **readATask(task)**

---

## 📜 License

This project is licensed under **LGPL-3.0-only**.
