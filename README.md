This following is a list of all the modules required for the router design: 
| Level                    | Module                | Description                                                  | Build Order |
| :----------------------- | :-------------------- | :----------------------------------------------------------- | :---------: |
| 🧩 **Basic**             | **Buffer**            | One-flit FIFO buffer with valid/ready handshake              |     ✅ ①     |
| 🚦 **Routing**           | **Router_Logic**      | Decides output direction based on hop_x/hop_y                |     ✅ ②     |
| 🏁 **Flow Control**      | **Input_Controller**  | Handles buffering, routing decision, valid signal generation |     ✅ ③     |
| 🎯 **Arbitration**       | **Arbiter**           | Chooses which input wins when multiple request same output   |     ✅ ④     |
| 📤 **Output_Controller** | **Output_Controller** | Gets data from arbiter, buffers and drives output            |     ✅ ⑤     |
| 🧠 **Node**              | **Node (Router)**     | Combines 5 input + 5 output controllers; toggles polarity    |     ✅ ⑥     |
| 🌐 **Mesh Top-Level**    | **Mesh_4x4**          | Instantiates 16 nodes, connects neighbors                    |     ✅ ⑦     |
| 🧪 **Testbench**         | **Mesh_TB**           | Drives packets, observes routing and delivery                |     ✅ ⑧     |
