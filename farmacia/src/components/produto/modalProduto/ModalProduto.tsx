import FormularioProduto from "../formularioProduto/FormularioProduto";

import "reactjs-popup/dist/index.css";
import Popup from "reactjs-popup";

import "./ModalProduto.css";

function ModalProduto() {
  return (
    <>
      <Popup
        trigger={
          <button className="rounded bg-indigo-900 text-white py-2 px-4">
            Cadastrar produto
          </button>
        }
        modal
      >
        <div>
          <FormularioProduto />
        </div>
      </Popup>
    </>
  );
}

export default ModalProduto;
