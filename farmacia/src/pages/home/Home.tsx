import homeLogo from "../../assets/home.png";
import "./Home.css";
import ModalProduto from "../../components/produto/modalProduto/ModalProduto";
import ListaProdutos from "../../components/produto/listaProduto/ListaProduto";

function Home() {
  return (
    <>
      <div className="bg-emerald-300 flex justify-center">
        <div className="container grid grid-cols-2 text-white">
          <div className="flex flex-col gap-4 items-center justify-center py-4">
            <h2 className="text-5xl text-black font-bold">Seja bem vindo!</h2>
            <p className="text-xl text-black">
              Aqui você encontra Medicamentos e Cosméticos
            </p>

            <div className="flex justify-around gap-4">
              <ModalProduto />
            </div>
          </div>
          <div className="flex justify-center ">
            <img src={homeLogo} alt="" className="w-2/3" />
          </div>
        </div>
      </div>
      <ListaProdutos />
    </>
  );
}

export default Home;
