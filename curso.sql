-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 19-Jun-2022 às 15:20
-- Versão do servidor: 10.4.17-MariaDB
-- versão do PHP: 7.4.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `curso`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `aluno`
--

CREATE TABLE `aluno` (
  `matricula` int(11) NOT NULL,
  `cpf` varchar(20) NOT NULL,
  `nome_completo` varchar(100) NOT NULL,
  `cidade` varchar(50) NOT NULL,
  `bairro` varchar(100) NOT NULL,
  `rua` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `celular` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `aluno`
--

INSERT INTO `aluno` (`matricula`, `cpf`, `nome_completo`, `cidade`, `bairro`, `rua`, `email`, `celular`) VALUES
(1, '000000000', 'caedead', 'ceadsd3e', 'cadsfcea', 'ceadsa', 'ceadda', '3123121'),
(2, '9821317318', 'hidchiabe', 'ojcooaedi', 'eiudhcae', 'duheaud', 'deaiud', '13123131231');

-- --------------------------------------------------------

--
-- Estrutura da tabela `alunocurso`
--

CREATE TABLE `alunocurso` (
  `matricula` int(11) NOT NULL,
  `cod_curso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `alunosala`
--

CREATE TABLE `alunosala` (
  `matricula` int(11) NOT NULL,
  `sala_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `curso`
--

CREATE TABLE `curso` (
  `cod_curso` int(11) NOT NULL,
  `nome_curso` varchar(100) NOT NULL,
  `carga_horaria` text NOT NULL,
  `desc_curso` varchar(100) NOT NULL,
  `cod_funcionario` int(11) NOT NULL,
  `sala_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `professor`
--

CREATE TABLE `professor` (
  `cod_funcionario` int(11) NOT NULL,
  `cpf` varchar(100) NOT NULL,
  `nome_completo` varchar(100) NOT NULL,
  `cidade` varchar(50) NOT NULL,
  `bairro` varchar(100) NOT NULL,
  `rua` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `celular` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `sala`
--

CREATE TABLE `sala` (
  `sala_id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `local` varchar(20) NOT NULL,
  `cap_total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `aluno`
--
ALTER TABLE `aluno`
  ADD PRIMARY KEY (`matricula`);

--
-- Índices para tabela `alunocurso`
--
ALTER TABLE `alunocurso`
  ADD PRIMARY KEY (`matricula`,`cod_curso`),
  ADD KEY `matricula` (`matricula`,`cod_curso`),
  ADD KEY `cod_curso` (`cod_curso`);

--
-- Índices para tabela `alunosala`
--
ALTER TABLE `alunosala`
  ADD PRIMARY KEY (`matricula`,`sala_id`),
  ADD KEY `matricula` (`matricula`,`sala_id`),
  ADD KEY `sala_id` (`sala_id`);

--
-- Índices para tabela `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`cod_curso`),
  ADD KEY `cod_funcionario` (`cod_funcionario`),
  ADD KEY `sala_id` (`sala_id`);

--
-- Índices para tabela `professor`
--
ALTER TABLE `professor`
  ADD PRIMARY KEY (`cod_funcionario`);

--
-- Índices para tabela `sala`
--
ALTER TABLE `sala`
  ADD PRIMARY KEY (`sala_id`) USING BTREE;

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `aluno`
--
ALTER TABLE `aluno`
  MODIFY `matricula` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `curso`
--
ALTER TABLE `curso`
  MODIFY `cod_curso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `professor`
--
ALTER TABLE `professor`
  MODIFY `cod_funcionario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `sala`
--
ALTER TABLE `sala`
  MODIFY `sala_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `alunocurso`
--
ALTER TABLE `alunocurso`
  ADD CONSTRAINT `alunocurso_ibfk_1` FOREIGN KEY (`matricula`) REFERENCES `aluno` (`matricula`),
  ADD CONSTRAINT `alunocurso_ibfk_2` FOREIGN KEY (`cod_curso`) REFERENCES `curso` (`cod_curso`);

--
-- Limitadores para a tabela `alunosala`
--
ALTER TABLE `alunosala`
  ADD CONSTRAINT `alunosala_ibfk_1` FOREIGN KEY (`matricula`) REFERENCES `aluno` (`matricula`),
  ADD CONSTRAINT `alunosala_ibfk_2` FOREIGN KEY (`sala_id`) REFERENCES `sala` (`sala_id`);

--
-- Limitadores para a tabela `curso`
--
ALTER TABLE `curso`
  ADD CONSTRAINT `curso_ibfk_1` FOREIGN KEY (`cod_funcionario`) REFERENCES `professor` (`cod_funcionario`),
  ADD CONSTRAINT `curso_ibfk_2` FOREIGN KEY (`sala_id`) REFERENCES `sala` (`sala_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
