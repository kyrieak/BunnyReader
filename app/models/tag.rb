class Tag < ActiveRecord::Base

  belongs_to :feed

  def get_node_att?
    self.get_node_att
  end

  def get_node_cont?
    self.get_node_cont
  end

  def self.default_title_args(node_name="title")
    return { name: 'Title',
             node_name: node_name,
             get_node_att: false,
             get_node_cont: true }
  end

  def self.default_link_args(node_name='link')
    return { name: 'Link',
             node_name: node_name,
             get_node_att: false,
             get_node_cont: true }
  end

  def self.default_desc_args(node_name='description')
    return { name: 'Description',
             node_name: node_name,
             get_node_att: false,
             get_node_cont: true }
  end

  def self.default_image_args(node_name, att_name='url')
    return { name: 'Image',
             node_name: node_name,
             att_name: att_name,
             get_node_att: true,
             get_node_cont: false }
  end

  def self.default_author_args(node_name)
    return { name: 'Author',
             node_name: node_name,
             get_node_att: false,
             get_node_cont: true }
  end


end